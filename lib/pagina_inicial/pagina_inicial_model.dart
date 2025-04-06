import '/backend/backend.dart';
import '/components/all_chats_comp_widget.dart';
import '/components/componenteperfil_widget.dart';
import '/components/create_taskcomponente_widget.dart';
import '/components/explore_componente_widget.dart';
import '/components/nav_bar_homes_widget.dart';
import '/components/nav_bar_tinder_widget.dart';
import '/components/paginainicial_componente_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'pagina_inicial_widget.dart' show PaginaInicialWidget;
import 'package:flutter/material.dart';

class PaginaInicialModel extends FlutterFlowModel<PaginaInicialWidget> {
  ///  Local state fields for this page.

  String? direcao = '';

  Color heartPress = Color(4279703062);

  bool aceitar = false;

  DocumentReference? taskDocument;

  ///  State fields for stateful widgets in this page.

  // Model for createTaskcomponente component.
  late CreateTaskcomponenteModel createTaskcomponenteModel;
  // Model for exploreComponente component.
  late ExploreComponenteModel exploreComponenteModel;
  // Model for allChatsComp component.
  late AllChatsCompModel allChatsCompModel;
  // Model for paginainicialComponente component.
  late PaginainicialComponenteModel paginainicialComponenteModel;
  // Model for componenteperfil component.
  late ComponenteperfilModel componenteperfilModel;
  // Model for navBarTinder component.
  late NavBarTinderModel navBarTinderModel;
  // Model for navBarHomes component.
  late NavBarHomesModel navBarHomesModel;

  @override
  void initState(BuildContext context) {
    createTaskcomponenteModel =
        createModel(context, () => CreateTaskcomponenteModel());
    exploreComponenteModel =
        createModel(context, () => ExploreComponenteModel());
    allChatsCompModel = createModel(context, () => AllChatsCompModel());
    paginainicialComponenteModel =
        createModel(context, () => PaginainicialComponenteModel());
    componenteperfilModel = createModel(context, () => ComponenteperfilModel());
    navBarTinderModel = createModel(context, () => NavBarTinderModel());
    navBarHomesModel = createModel(context, () => NavBarHomesModel());
  }

  @override
  void dispose() {
    createTaskcomponenteModel.dispose();
    exploreComponenteModel.dispose();
    allChatsCompModel.dispose();
    paginainicialComponenteModel.dispose();
    componenteperfilModel.dispose();
    navBarTinderModel.dispose();
    navBarHomesModel.dispose();
  }
}
