import '/components/componenteperfil_widget.dart';
import '/components/nav_bar_homes_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'perfil_do_usuario_widget.dart' show PerfilDoUsuarioWidget;
import 'package:flutter/material.dart';

class PerfilDoUsuarioModel extends FlutterFlowModel<PerfilDoUsuarioWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for componenteperfil component.
  late ComponenteperfilModel componenteperfilModel;
  // Model for navBarHomes component.
  late NavBarHomesModel navBarHomesModel;

  @override
  void initState(BuildContext context) {
    componenteperfilModel = createModel(context, () => ComponenteperfilModel());
    navBarHomesModel = createModel(context, () => NavBarHomesModel());
  }

  @override
  void dispose() {
    componenteperfilModel.dispose();
    navBarHomesModel.dispose();
  }
}
