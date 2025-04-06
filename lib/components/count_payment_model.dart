import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_count_controller.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'count_payment_widget.dart' show CountPaymentWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CountPaymentModel extends FlutterFlowModel<CountPaymentWidget> {
  ///  Local state fields for this component.

  bool error = false;

  ///  State fields for stateful widgets in this component.

  // State field(s) for CountController widget.
  int? countControllerValue;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
