import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/deposit_success_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/index.dart';
import 'package:flutter/material.dart';
import 'stripe_payment_intent_model.dart';
export 'stripe_payment_intent_model.dart';

class StripePaymentIntentWidget extends StatefulWidget {
  const StripePaymentIntentWidget({
    super.key,
    required this.value,
    required this.momento,
  });

  final double? value;
  final String? momento;

  @override
  State<StripePaymentIntentWidget> createState() =>
      _StripePaymentIntentWidgetState();
}

class _StripePaymentIntentWidgetState extends State<StripePaymentIntentWidget> {
  late StripePaymentIntentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => StripePaymentIntentModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AuthUserStreamWidget(
      builder: (context) => Container(
        width: double.infinity,
        height: MediaQuery.sizeOf(context).height * 0.5,
        child: custom_widgets.StripePaymentWidget(
          width: double.infinity,
          height: MediaQuery.sizeOf(context).height * 0.5,
          emailDoCliente: currentUserEmail,
          customerName: currentUserDisplayName,
          amount: widget.value!,
          description: widget.momento == 'requestTask'
              ? 'Request Task in Quicky'
              : 'Deposit Quicky Wallet',
          onPaymentSuccess: (status, paymentId) async {
            if (widget.momento == 'requestTask') {
              if (paymentId != null && paymentId != '') {
                _model.saldoAdd = await AddSaldoNoStripeConnectCall.call(
                  connectedAccountId:
                      valueOrDefault(currentUserDocument?.clienteStripeId, ''),
                  amount: widget.value.toString(),
                  paymentIntentId: paymentId,
                );

                if (getJsonField(
                  (_model.saldoAdd?.jsonBody ?? ''),
                  r'''$.success''',
                )) {
                  await currentUserReference!.update(createUsersRecordData(
                    transferId: getJsonField(
                      (_model.saldoAdd?.jsonBody ?? ''),
                      r'''$.transferId''',
                    ).toString(),
                  ));
                  Navigator.pop(context);

                  context.pushNamed(RequestEvaluationWidget.routeName);
                }
              }
            } else {
              if (paymentId != null && paymentId != '') {
                await currentUserReference!.update({
                  ...mapToFirestore(
                    {
                      'saldo': FieldValue.increment(widget.value!),
                      'deposityTransacoes': FieldValue.arrayUnion([
                        getDepositsTaskeeFirestoreData(
                          updateDepositsTaskeeStruct(
                            DepositsTaskeeStruct(
                              amount: widget.value,
                              day: getCurrentTimestamp,
                              idDeTransacao: paymentId,
                            ),
                            clearUnsetFields: false,
                          ),
                          true,
                        )
                      ]),
                    },
                  ),
                });
                Navigator.pop(context);
                await showModalBottomSheet(
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  enableDrag: false,
                  context: context,
                  builder: (context) {
                    return Padding(
                      padding: MediaQuery.viewInsetsOf(context),
                      child: DepositSuccessWidget(
                        deposityValue: widget.value!,
                        idDeTransasao: paymentId,
                      ),
                    );
                  },
                ).then((value) => safeSetState(() {}));
              }
            }

            safeSetState(() {});
          },
        ),
      ),
    );
  }
}
