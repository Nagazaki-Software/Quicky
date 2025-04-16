import '/components/explore_componente_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'exploretasks_widget.dart' show ExploretasksWidget;
import 'package:flutter/material.dart';

class ExploretasksModel extends FlutterFlowModel<ExploretasksWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for exploreComponente component.
  late ExploreComponenteModel exploreComponenteModel;

  @override
  void initState(BuildContext context) {
    exploreComponenteModel =
        createModel(context, () => ExploreComponenteModel());
  }

  @override
  void dispose() {
    exploreComponenteModel.dispose();
  }
}
