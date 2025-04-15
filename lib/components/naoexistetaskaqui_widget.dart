import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'naoexistetaskaqui_model.dart';
export 'naoexistetaskaqui_model.dart';

/// nao existe nenhuma task nessa regiao
class NaoexistetaskaquiWidget extends StatefulWidget {
  const NaoexistetaskaquiWidget({super.key});

  @override
  State<NaoexistetaskaquiWidget> createState() =>
      _NaoexistetaskaquiWidgetState();
}

class _NaoexistetaskaquiWidgetState extends State<NaoexistetaskaquiWidget> {
  late NaoexistetaskaquiModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NaoexistetaskaquiModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'No Tasks Found',
                style: FlutterFlowTheme.of(context).headlineSmall.override(
                      fontFamily: 'Inter',
                      letterSpacing: 0.0,
                    ),
              ),
              Text(
                'There are currently no tasks available in this region. Check back later for new assignments.',
                textAlign: TextAlign.center,
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Readex Pro',
                      color: FlutterFlowTheme.of(context).secondaryText,
                      letterSpacing: 0.0,
                    ),
              ),
            ].divide(SizedBox(height: 16.0)),
          ),
        ),
      ),
    );
  }
}
