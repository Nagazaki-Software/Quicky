import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'stripe_identify_model.dart';
export 'stripe_identify_model.dart';

class StripeIdentifyWidget extends StatefulWidget {
  const StripeIdentifyWidget({super.key});

  @override
  State<StripeIdentifyWidget> createState() => _StripeIdentifyWidgetState();
}

class _StripeIdentifyWidgetState extends State<StripeIdentifyWidget> {
  late StripeIdentifyModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => StripeIdentifyModel());

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
        height: double.infinity,
        child: custom_widgets.IdentityVerificationWidget(
          width: double.infinity,
          height: double.infinity,
          accountId: valueOrDefault(currentUserDocument?.clienteStripeId, ''),
          uid: currentUserReference!.id,
          onVerificationSuccess: (onSuccess) async {},
        ),
      ),
    );
  }
}
