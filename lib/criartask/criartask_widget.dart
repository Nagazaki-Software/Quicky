import '/components/create_taskcomponente_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'criartask_model.dart';
export 'criartask_model.dart';

/// tela de editar perfil do tinder
class CriartaskWidget extends StatefulWidget {
  const CriartaskWidget({super.key});

  static String routeName = 'criartask';
  static String routePath = '/criartask';

  @override
  State<CriartaskWidget> createState() => _CriartaskWidgetState();
}

class _CriartaskWidgetState extends State<CriartaskWidget> {
  late CriartaskModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CriartaskModel());

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
