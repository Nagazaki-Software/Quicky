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

import '/flutter_flow/flutter_flow_widgets.dart';

import 'dart:convert';
import 'dart:math';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:http/http.dart' as http;
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/number_symbols_data.dart';
import 'package:intl/intl.dart';

const stripePublishableKey =
    'pk_test_51RFCsnGTOG08DTzfi58RUiJTJCsaitNde8z3v6fIAa6xgoMGwWKCHcp6W0aYdyuFzkFikhQk7McpQAyl2rqtq8cP00kHHZ6yZc';

Future initializeStripe() async {
  Stripe.publishableKey = stripePublishableKey;
  await Stripe.instance.applySettings();
}

class StripePaymentResponse {
  const StripePaymentResponse({this.paymentId, this.errorMessage});
  final String? paymentId;
  final String? errorMessage;
}

class StripePaymentWidget extends StatefulWidget {
  final String emailDoCliente;
  final String customerName;
  final double width;
  final double height;
  final double amount;
  final String description;
  final Future Function(String? status, String? paymentId)? onPaymentSuccess;

  const StripePaymentWidget({
    super.key,
    required this.emailDoCliente,
    required this.customerName,
    required this.width,
    required this.description,
    required this.height,
    required this.amount,
    this.onPaymentSuccess,
  });

  @override
  State<StripePaymentWidget> createState() => _StripePaymentWidgetState();
}

Future<String?> verificarStatusPagamento(String paymentId) async {
  final url = Uri.parse(
      'https://us-central1-quick-b108e.cloudfunctions.net/verifiquePaymentIntent');

  final response = await http.post(
    url,
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode({'paymentId': paymentId}),
  );

  if (response.statusCode != 200) {
    return null;
  }

  final data = jsonDecode(response.body);
  return data['status'] as String?;
}

class _StripePaymentWidgetState extends State<StripePaymentWidget> {
  Future<Map<String, dynamic>> _createPaymentIntent({
    required num amount,
    required String currency,
    required String email,
    required String name,
    required String description,
  }) async {
    final url = Uri.parse(
        'https://us-central1-quick-b108e.cloudfunctions.net/createPaymentIntent');

    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'amount': (amount * 100).round(),
        'currency': "USD",
        'email': email,
        'name': name,
        'description': description,
      }),
    );

    if (response.statusCode != 200) {
      throw Exception('Erro ao criar PaymentIntent: ${response.body}');
    }

    return jsonDecode(response.body);
  }

  Future<StripePaymentResponse> processStripePayment(
    BuildContext context, {
    required num amount,
    required String currency,
    required String description,
    Color? buttonColor,
    Color? buttonTextColor,
    ThemeMode themeStyle = ThemeMode.system,
  }) async {
    try {
      final response = await _createPaymentIntent(
        amount: amount,
        currency: "USD",
        email: widget.emailDoCliente,
        name: widget.customerName,
        description: description,
      );

      final paymentIntent = response['paymentIntent'];
      final paymentId = response['paymentId'];

      if (paymentIntent == null) {
        return StripePaymentResponse(
            errorMessage: 'Erro ao criar PaymentIntent');
      }

      if (kIsWeb) {
        return await showWebPaymentSheet(
          context,
          paymentId: paymentId,
          paymentIntentSecret: paymentIntent,
          amount: amount,
          currency: "USD",
          description: description,
          buttonColor: buttonColor,
          buttonTextColor: buttonTextColor,
          themeStyle: themeStyle,
        );
      }

      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          paymentIntentClientSecret: paymentIntent, // Gerado no backend
          merchantDisplayName: 'Quicky Tasks',
          applePay: const PaymentSheetApplePay(
            merchantCountryCode: 'US',
          ),
          googlePay: const PaymentSheetGooglePay(
            merchantCountryCode: 'US',
            testEnv: true,
          ),
          style: themeStyle,
          billingDetails: BillingDetails(
            email: widget.emailDoCliente,
            phone: '+15555555555',
            name: widget.customerName,
            address: Address(
              city: 'San Francisco',
              country: 'US',
              line1: '123 Main St',
              line2: '',
              state: 'CA',
              postalCode: '94111',
            ),
          ),
        ),
      );

      await Stripe.instance.presentPaymentSheet();

      return StripePaymentResponse(paymentId: paymentId);
    } catch (e) {
      if (e is StripeException && e.error.code == FailureCode.Canceled) {
        return StripePaymentResponse();
      }
      return StripePaymentResponse(errorMessage: '$e');
    }
  }

  Future<StripePaymentResponse> showWebPaymentSheet(
    BuildContext context, {
    required String paymentId,
    required String paymentIntentSecret,
    required num amount,
    required String currency,
    required String description,
    Color? buttonColor,
    Color? buttonTextColor,
    ThemeMode? themeStyle,
  }) async {
    final isDarkMode = themeStyle == null
        ? Theme.of(context).brightness == Brightness.dark
        : themeStyle == ThemeMode.dark;
    buttonColor = buttonColor ?? FlutterFlowTheme.of(context).primary;
    final screenWidth = MediaQuery.sizeOf(context).width;

    final buildPaymentSheet = (BuildContext context, double width) => Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Material(
                color: Colors.transparent,
                child: Container(
                  width: width,
                  padding: const EdgeInsets.fromLTRB(24.0, 14.0, 24.0, 24.0),
                  color: isDarkMode ? const Color(0xFF101213) : Colors.white,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Informações do pagamento',
                        style: GoogleFonts.outfit(
                          fontSize: 28,
                          fontWeight: FontWeight.w500,
                          color: isDarkMode
                              ? Colors.white
                              : const Color(0xFF101213),
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      CardField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      FFButtonWidget(
                        onPressed: () async {
                          try {
                            final result = await Stripe.instance.confirmPayment(
                              paymentIntentClientSecret: paymentIntentSecret,
                              data: PaymentMethodParams.card(
                                paymentMethodData: PaymentMethodData(),
                              ),
                              options: const PaymentMethodOptions(),
                            );
                            if (result.status ==
                                PaymentIntentsStatus.Succeeded) {
                              debugPrint(
                                  'Pagamento confirmado. Retornando paymentId');
                              Navigator.pop(
                                context,
                                StripePaymentResponse(paymentId: paymentId),
                              );
                            }
                          } catch (e) {
                            Navigator.pop(
                              context,
                              StripePaymentResponse(errorMessage: '$e'),
                            );
                          }
                        },
                        text:
                            'Pagar ${_displayAmount(currency, amount.toDouble())}',
                        options: FFButtonOptions(
                          width: double.infinity,
                          height: 60,
                          color: buttonColor,
                          textStyle: GoogleFonts.outfit(
                            color: buttonTextColor ?? Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );

    final result = await showDialog<StripePaymentResponse>(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.transparent,
        contentPadding: EdgeInsets.zero,
        content: buildPaymentSheet(context, min(420, screenWidth - 16)),
      ),
    );

    return result ?? StripePaymentResponse();
  }

  String _displayAmount(String currency, double amount) {
    return NumberFormat.simpleCurrency(name: currency).format(amount);
  }

  @override
  void initState() {
    super.initState();
    _startPaymentProcess();
  }

  void _startPaymentProcess() async {
    final paymentCallback = widget.onPaymentSuccess;

    final result = await processStripePayment(
      context,
      amount: widget.amount,
      currency: 'USD',
      description: widget.description,
    );

    if (result.paymentId != null) {
      final status = await verificarStatusPagamento(result.paymentId!);
      if (status == 'succeeded') {
        debugPrint('Chamando onPaymentSuccess com sucesso');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Pagamento realizado com sucesso!')),
        );
        await paymentCallback?.call('success', result.paymentId);
      } else {
        debugPrint('Pagamento falhou ou pendente. Status: $status');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Pagamento falhou ou foi cancelado.')),
        );
        await paymentCallback?.call(null, null);
      }
    } else {
      debugPrint('Erro no pagamento: ${result.errorMessage}');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Erro: ${result.errorMessage ?? 'Desconhecido'}'),
        ),
      );
      await paymentCallback?.call(null, null);
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
