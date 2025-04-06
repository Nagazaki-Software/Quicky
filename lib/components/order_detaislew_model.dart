import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/stripe/payment_manager.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'order_detaislew_widget.dart' show OrderDetaislewWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class OrderDetaislewModel extends FlutterFlowModel<OrderDetaislewWidget> {
  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Stripe Payment] action in Button widget.
  String? paymentId23;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
