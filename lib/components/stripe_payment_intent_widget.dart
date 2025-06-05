import '/auth/firebase_auth/auth_util.dart';
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
    this.task,
    this.fastpass,
  });

  final double? value;
  final String? momento;
  final DocumentReference? task;
  final int? fastpass;

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
          clienteStripeId:
              valueOrDefault(currentUserDocument?.clienteStripeId, ''),
          fastpass: valueOrDefault<int>(
            widget.fastpass,
            0,
          ),
          onPaymentSuccess: (status, paymentId) async {
            if (widget.momento == 'requestTask') {
              if (paymentId != null && paymentId != '') {
                if (widget.task != null) {
                  await currentUserReference!.update({
                    ...createUsersRecordData(
                      transferId: paymentId,
                    ),
                    ...mapToFirestore(
                      {
                        'requestEmNumber': FieldValue.increment(1),
                        'requestPedidos': FieldValue.arrayUnion([widget.task]),
                      },
                    ),
                  });
                } else {
                  await widget.task!.update(createTasksRecordData(
                    status: 'Not paid',
                  ));
                }

                Navigator.pop(context);

                context.pushNamed(RequestEvaluationWidget.routeName);
              } else {
                await widget.task!.update(createTasksRecordData(
                  status: 'Not paid',
                ));
              }
            } else {
              if (paymentId != null && paymentId != '') {
                await currentUserReference!.update({
                  ...createUsersRecordData(
                    transferId: paymentId,
                  ),
                  ...mapToFirestore(
                    {
                      'saldo': FieldValue.increment(widget.value!),
                    },
                  ),
                });
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
          },
        ),
      ),
    );
  }
}
