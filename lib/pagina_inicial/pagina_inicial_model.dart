import '/backend/backend.dart';
import '/components/paginainicial_componente_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'pagina_inicial_widget.dart' show PaginaInicialWidget;
import 'package:flutter/material.dart';

class PaginaInicialModel extends FlutterFlowModel<PaginaInicialWidget> {
  ///  Local state fields for this page.

  String? direcao = '';

  Color heartPress = Color(4279703062);

  bool aceitar = false;

  DocumentReference? taskDocument;

  ///  State fields for stateful widgets in this page.

  // Model for paginainicialComponente component.
  late PaginainicialComponenteModel paginainicialComponenteModel;

  @override
  void initState(BuildContext context) {
    paginainicialComponenteModel =
        createModel(context, () => PaginainicialComponenteModel());
  }

  @override
  void dispose() {
    paginainicialComponenteModel.dispose();
  }
}
