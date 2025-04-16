import '/components/componenteperfil_widget.dart';
import '/components/nav_bar_homes_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'perfil_do_usuario_model.dart';
export 'perfil_do_usuario_model.dart';

/// crie uma pagina de meu perfil
class PerfilDoUsuarioWidget extends StatefulWidget {
  const PerfilDoUsuarioWidget({super.key});

  static String routeName = 'PerfilDoUsuario';
  static String routePath = '/perfilDoUsuario';

  @override
  State<PerfilDoUsuarioWidget> createState() => _PerfilDoUsuarioWidgetState();
}

class _PerfilDoUsuarioWidgetState extends State<PerfilDoUsuarioWidget> {
  late PerfilDoUsuarioModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PerfilDoUsuarioModel());

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
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50.0),
          child: AppBar(
            backgroundColor: Colors.white,
            automaticallyImplyLeading: false,
            actions: [],
            flexibleSpace: FlexibleSpaceBar(
              title: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 14.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    wrapWithModel(
                      model: _model.navBarHomesModel,
                      updateCallback: () => safeSetState(() {}),
                      child: NavBarHomesWidget(),
                    ),
                  ],
                ),
              ),
              centerTitle: true,
              expandedTitleScale: 1.0,
            ),
            elevation: 2.0,
          ),
        ),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            wrapWithModel(
              model: _model.componenteperfilModel,
              updateCallback: () => safeSetState(() {}),
              child: ComponenteperfilWidget(),
            ),
          ].divide(SizedBox(height: 24.0)),
        ),
      ),
    );
  }
}
