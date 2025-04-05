import '/components/create_taskcomponente_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'teladeeditarperfil_copy3_model.dart';
export 'teladeeditarperfil_copy3_model.dart';

/// tela de editar perfil do tinder
class TeladeeditarperfilCopy3Widget extends StatefulWidget {
  const TeladeeditarperfilCopy3Widget({super.key});

  static String routeName = 'teladeeditarperfilCopy3';
  static String routePath = '/teladeeditarperfilCopy3';

  @override
  State<TeladeeditarperfilCopy3Widget> createState() =>
      _TeladeeditarperfilCopy3WidgetState();
}

class _TeladeeditarperfilCopy3WidgetState
    extends State<TeladeeditarperfilCopy3Widget> {
  late TeladeeditarperfilCopy3Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TeladeeditarperfilCopy3Model());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              wrapWithModel(
                model: _model.createTaskcomponenteModel,
                updateCallback: () => safeSetState(() {}),
                child: CreateTaskcomponenteWidget(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
