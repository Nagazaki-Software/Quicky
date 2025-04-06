import '/components/componenteperfil_widget.dart';
import '/components/nav_bar_tinder_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'perfil_do_usuario_widget.dart' show PerfilDoUsuarioWidget;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

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
