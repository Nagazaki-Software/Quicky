import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'payment_stripe_model.dart';
export 'payment_stripe_model.dart';

class PaymentStripeWidget extends StatefulWidget {
  const PaymentStripeWidget({super.key});

  @override
  State<PaymentStripeWidget> createState() => _PaymentStripeWidgetState();
}

class _PaymentStripeWidgetState extends State<PaymentStripeWidget> {
  late PaymentStripeModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PaymentStripeModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [],
    );
  }
}
