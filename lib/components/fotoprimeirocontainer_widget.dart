import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'fotoprimeirocontainer_model.dart';
export 'fotoprimeirocontainer_model.dart';

/// container alertando para adicione a foto primeiro para visualizar seu
/// swipe task
class FotoprimeirocontainerWidget extends StatefulWidget {
  const FotoprimeirocontainerWidget({super.key});

  @override
  State<FotoprimeirocontainerWidget> createState() =>
      _FotoprimeirocontainerWidgetState();
}

class _FotoprimeirocontainerWidgetState
    extends State<FotoprimeirocontainerWidget> {
  late FotoprimeirocontainerModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FotoprimeirocontainerModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(
          width: 1.0,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(12.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Icon(
              Icons.info_outlined,
              color: FlutterFlowTheme.of(context).primary,
              size: 24.0,
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Add Photo First',
                    style: FlutterFlowTheme.of(context).bodyLarge.override(
                          fontFamily: 'Readex Pro',
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                  Text(
                    'Please add a photo to your task before swiping. This helps others better understand and complete the task.',
                    style: FlutterFlowTheme.of(context).bodySmall.override(
                          fontFamily: 'Readex Pro',
                          color: FlutterFlowTheme.of(context).secondaryText,
                          letterSpacing: 0.0,
                        ),
                  ),
                ],
              ),
            ),
          ].divide(SizedBox(width: 12.0)),
        ),
      ),
    );
  }
}
