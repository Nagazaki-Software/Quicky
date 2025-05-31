// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:stripe_identity_plugin/stripe_identity_plugin.dart';
import 'package:stripe_identity_plugin/utils/enum.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class IdentityVerificationWidget extends StatefulWidget {
  final String accountId; // Exemplo: 'acct_1RUTxhDHIdKedYiX'
  final double width;
  final double height;
  final String uid;
  final Future<void> Function(String onSuccess)? onVerificationSuccess;

  const IdentityVerificationWidget({
    Key? key,
    required this.accountId,
    required this.width,
    required this.height,
    required this.uid,
    this.onVerificationSuccess,
  }) : super(key: key);

  @override
  _IdentityVerificationWidgetState createState() =>
      _IdentityVerificationWidgetState();
}

class _IdentityVerificationWidgetState
    extends State<IdentityVerificationWidget> {
  String _statusMessage = 'Iniciando verificação...';

  @override
  void initState() {
    super.initState();
    startVerification(); // inicia automaticamente
  }

  Future<void> startVerification() async {
    setState(() {
      _statusMessage = '🔄 Iniciando verificação...';
    });

    try {
      final response = await http.post(
        Uri.parse(
            'https://southamerica-east1-quick-b108e.cloudfunctions.net/createVerificationSession'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'clientStripeId': widget.accountId,
          'userId': widget.uid,
        }),
      );

      final rawBody = response.body;
      print('📡 Resposta da Cloud Function: $rawBody');

      final data = jsonDecode(rawBody);

      if (response.statusCode != 200 || data['success'] != true) {
        setState(() => _statusMessage =
            '❌ Erro na criação da sessão: ${data['message'] ?? 'Erro desconhecido.'}');
        print('❌ Detalhes do erro: $data');
        return;
      }

      final sessionId = data['sessionId'];
      final ephemeralKey = data['ephemeralKeySecret'];

      if (sessionId == null || ephemeralKey == null) {
        setState(() => _statusMessage =
            '❌ sessionId ou ephemeralKey ausente na resposta.');
        print('⚠️ sessionId: $sessionId | ephemeralKey: $ephemeralKey');
        return;
      }

      final stripeIdentity = StripeIdentityPlugin();
      final result = await stripeIdentity.startVerification(
        id: sessionId,
        key: ephemeralKey,
        brandLogoUrl:
            'https://firebasestorage.googleapis.com/v0/b/quick-b108e.firebasestorage.app/o/Artboard_14.png?alt=media&token=d2a9c97e-6d9a-43c3-a48e-72cda7099b1c',
      );

      final status = result.$1;
      final message = result.$2;

      print(
          '📲 Resultado StripeIdentity: status=$status | mensagem="$message"');

      switch (status) {
        case VerificationResult.completed:
          setState(() =>
              _statusMessage = '✅ Verificação concluída! Atualizando conta...');
          final userId = FirebaseAuth.instance.currentUser?.uid;
          if (userId != null) {
            await FirebaseFirestore.instance
                .collection('users')
                .doc(userId)
                .update({'verifyaccount': true});

            if (!mounted) return;

            if (widget.onVerificationSuccess != null) {
              await widget.onVerificationSuccess!(
                  "✅ Verificação concluída com sucesso.");
            }
          } else {
            setState(() => _statusMessage = '⚠️ Usuário não autenticado.');
          }
          break;

        case VerificationResult.canceled:
          setState(
              () => _statusMessage = '⚠️ Verificação cancelada pelo usuário.');
          break;

        case VerificationResult.failed:
          setState(() => _statusMessage = '❌ Falha na verificação: $message');
          break;

        case VerificationResult.unknown:
          setState(() => _statusMessage = '❓ Erro desconhecido: $message');
          break;
      }
    } catch (e, stackTrace) {
      print('❌ Erro inesperado: $e');
      print('🧩 Stack trace: $stackTrace');
      setState(() => _statusMessage = 'Erro inesperado: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Text(_statusMessage, textAlign: TextAlign.center),
        ),
      ),
    );
  }
}
