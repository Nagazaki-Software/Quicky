// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:cloud_functions/cloud_functions.dart'; // Importação correta do cloud_functions
import 'package:firebase_core/firebase_core.dart'; // Importação do Firebase
import 'package:flutter_stripe/flutter_stripe.dart'; // Biblioteca do Stripe
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http; // Biblioteca HTTP
import 'dart:convert'; // Para manipulação de JSON

class StripeCheckoutScreen extends StatefulWidget {
  const StripeCheckoutScreen({
    super.key,
    this.width,
    this.height,
    required this.paymentIntentValue,
    required this.name,
    required this.email,
    required this.phone,
    required this.addressLatLng,
    required this.city,
    required this.country,
    required this.postalCode,
    required this.state,
    required this.amount,
    required this.clientID,
    this.currency = 'usd',
    required this.accountId, // Aqui você adiciona a variável accountId
  });

  final double? width;
  final double? height;
  final String paymentIntentValue;
  final String name;
  final String email;
  final String phone;
  final LatLng addressLatLng;
  final String city;
  final String country;
  final String postalCode;
  final String state;
  final String amount;
  final String clientID;
  final String currency;
  final String accountId; // Definindo accountId

  @override
  _StripeCheckoutScreenState createState() => _StripeCheckoutScreenState();
}

class _StripeCheckoutScreenState extends State<StripeCheckoutScreen> {
  bool _isProcessing = false;
  Map<String, dynamic>? paymentIntent;

  @override
  void initState() {
    super.initState();
  }

  Future<void> createPaymentIntent() async {
    try {
      final url = Uri.parse('https://api.stripe.com/v1/payment_intents');
      final response = await http.post(
        url,
        headers: {
          'Authorization':
              'Bearer pk_test_51RbYviCFk8wl8pruJ2cR2bIaSrhXjBq4QU4kW4WlR2cRgJdxOtVpTRJ7l3VIPSbegoj8PBCs8ODLMA5QtVtg4ZED00Zhn4kfQK', // Substitua com sua chave secreta do Stripe
          'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: {
          'amount': (int.parse(widget.amount) * 100)
              .toString(), // O Stripe usa o valor em centavos
          'currency': widget.currency,
          'payment_method_types[]': 'card',
          'description': 'Pagamento para ${widget.name}',
          'metadata': json.encode({
            'clientID': widget.clientID,
            'accountId': widget.accountId,
          }),
        },
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final clientSecret = data['client_secret'];
        if (clientSecret != null) {
          paymentIntent =
              data; // Salva o PaymentIntent para ser usado no pagamento
        } else {
          Fluttertoast.showToast(msg: "Erro ao criar PaymentIntent");
        }
      } else {
        Fluttertoast.showToast(msg: "Erro ao chamar Stripe: ${response.body}");
        print("Erro no Stripe: ${response.body}");
      }
    } catch (e) {
      Fluttertoast.showToast(
          msg: "Erro ao chamar API do Stripe: ${e.toString()}");
      print("Erro ao chamar API do Stripe: ${e.toString()}");
    }
  }

  Future<void> stripeMakePayment() async {
    setState(() {
      _isProcessing = true;
    });

    try {
      await createPaymentIntent(); // Chama a função de criação do PaymentIntent

      String paymentIntentClientSecret =
          paymentIntent?['client_secret']?.toString() ?? '';
      if (paymentIntentClientSecret.isEmpty) {
        Fluttertoast.showToast(msg: 'Erro: client_secret não encontrado');
        return;
      }

      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          paymentIntentClientSecret: paymentIntentClientSecret,
          merchantDisplayName: 'Quicky',
        ),
      );

      await Stripe.instance.presentPaymentSheet();
      Fluttertoast.showToast(msg: 'Pagamento realizado com sucesso');
    } catch (e) {
      if (e is StripeException) {
        Fluttertoast.showToast(
            msg: 'Erro do Stripe: ${e.error.localizedMessage}');
      } else {
        Fluttertoast.showToast(msg: 'Erro inesperado: ${e.toString()}');
      }
      print('Erro no pagamento: ${e.toString()}');
    } finally {
      setState(() {
        _isProcessing = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _isProcessing
            ? Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.brown),
                  ),
                  SizedBox(height: 10),
                  Text('Processando pagamento...'),
                ],
              )
            : Column(
                children: [
                  ElevatedButton(
                    onPressed: stripeMakePayment,
                    child: Text("Realizar Pagamento"),
                  ),
                ],
              ),
      ),
    );
  }
}
