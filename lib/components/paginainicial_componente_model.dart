import '/components/widget_pagina_inicial_filters_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'paginainicial_componente_widget.dart'
    show PaginainicialComponenteWidget;
import 'package:flutter/material.dart';

class PaginainicialComponenteModel
    extends FlutterFlowModel<PaginainicialComponenteWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for widgetPaginaInicialFilters component.
  late WidgetPaginaInicialFiltersModel widgetPaginaInicialFiltersModel;

  @override
  void initState(BuildContext context) {
    widgetPaginaInicialFiltersModel =
        createModel(context, () => WidgetPaginaInicialFiltersModel());
  }

  @override
  void dispose() {
    widgetPaginaInicialFiltersModel.dispose();
  }
}
