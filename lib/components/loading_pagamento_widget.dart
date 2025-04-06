import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'loading_pagamento_model.dart';
export 'loading_pagamento_model.dart';

/// BOTTOM SHEET LOADING STRIPE PAGAMENTOS
class LoadingPagamentoWidget extends StatefulWidget {
  const LoadingPagamentoWidget({
    super.key,
    this.value,
    required this.sessionID,
  });

  final String? value;
  final String? sessionID;

  @override
  State<LoadingPagamentoWidget> createState() => _LoadingPagamentoWidgetState();
}

class _LoadingPagamentoWidgetState extends State<LoadingPagamentoWidget> {
  late LoadingPagamentoModel _model;

  LatLng? currentUserLocationValue;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LoadingPagamentoModel());

    getCurrentUserLocation(defaultLocation: LatLng(0.0, 0.0), cached: true)
        .then((loc) => safeSetState(() => currentUserLocationValue = loc));
    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (currentUserLocationValue == null) {
      return Container(
        color: FlutterFlowTheme.of(context).primaryBackground,
        child: Center(
          child: SizedBox(
            width: 50.0,
            height: 50.0,
            child: SpinKitFadingCube(
              color: FlutterFlowTheme.of(context).primary,
              size: 50.0,
            ),
          ),
        ),
      );
    }

    return AuthUserStreamWidget(
      builder: (context) => Container(
        width: double.infinity,
        height: double.infinity,
        child: custom_widgets.StripeCheckoutScreen(
          width: double.infinity,
          height: double.infinity,
          paymentIntentValue: widget!.value!,
          name: currentUserDisplayName,
          email: currentUserEmail,
          phone: '3399800793',
          city: 'Governador Valadares',
          postalCode: '35032390',
          state: 'Minas Gerais',
          amount: widget!.value!,
          clientID: valueOrDefault(currentUserDocument?.stripeAccountID, ''),
          country: 'Minas Gerais',
          currency: 'usd',
          accountId: valueOrDefault(currentUserDocument?.stripeAccountID, ''),
          addressLatLng: currentUserLocationValue!,
        ),
      ),
    );
  }
}
