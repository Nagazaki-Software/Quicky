import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'premium_plan_model.dart';
export 'premium_plan_model.dart';

/// container adversing for premium
class PremiumPlanWidget extends StatefulWidget {
  const PremiumPlanWidget({super.key});

  @override
  State<PremiumPlanWidget> createState() => _PremiumPlanWidgetState();
}

class _PremiumPlanWidgetState extends State<PremiumPlanWidget> {
  late PremiumPlanModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PremiumPlanModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
