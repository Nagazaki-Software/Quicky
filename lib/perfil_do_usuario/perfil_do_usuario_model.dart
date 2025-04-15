import '/components/componenteperfil_widget.dart';
import '/components/nav_bar_tinder_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'perfil_do_usuario_widget.dart' show PerfilDoUsuarioWidget;
import 'package:flutter/material.dart';

class PerfilDoUsuarioModel extends FlutterFlowModel<PerfilDoUsuarioWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for componenteperfil component.
  late ComponenteperfilModel componenteperfilModel;
  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // Model for navBarTinder component.
  late NavBarTinderModel navBarTinderModel;

  @override
  void initState(BuildContext context) {
    componenteperfilModel = createModel(context, () => ComponenteperfilModel());
    navBarTinderModel = createModel(context, () => NavBarTinderModel());
  }

  @override
  void dispose() {
    componenteperfilModel.dispose();
    navBarTinderModel.dispose();
  }
}
