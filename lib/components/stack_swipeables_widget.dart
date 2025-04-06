import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'stack_swipeables_model.dart';
export 'stack_swipeables_model.dart';

class StackSwipeablesWidget extends StatefulWidget {
  const StackSwipeablesWidget({
    super.key,
    this.parameter1,
    this.parameter2,
    this.parameter3,
    this.parameter4,
  });

  final List<String>? parameter1;
  final String? parameter2;
  final String? parameter3;
  final DocumentReference? parameter4;

  @override
  State<StackSwipeablesWidget> createState() => _StackSwipeablesWidgetState();
}

class _StackSwipeablesWidgetState extends State<StackSwipeablesWidget> {
  late StackSwipeablesModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => StackSwipeablesModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(0.0, -1.0),
      child: Container(
        width: double.infinity,
        height: MediaQuery.sizeOf(context).height * 0.73,
        child: Stack(
          children: [],
        ),
      ),
    );
  }
}
