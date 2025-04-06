import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'getmore_model.dart';
export 'getmore_model.dart';

/// row with get more swipe, get more renegociate and subscription
class GetmoreWidget extends StatefulWidget {
  const GetmoreWidget({super.key});

  @override
  State<GetmoreWidget> createState() => _GetmoreWidgetState();
}

class _GetmoreWidgetState extends State<GetmoreWidget> {
  late GetmoreModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GetmoreModel());

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
