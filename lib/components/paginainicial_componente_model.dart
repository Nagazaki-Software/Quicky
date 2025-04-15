import '/components/swipeable_stacks_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'paginainicial_componente_widget.dart'
    show PaginainicialComponenteWidget;
import 'package:flutter/material.dart';

class PaginainicialComponenteModel
    extends FlutterFlowModel<PaginainicialComponenteWidget> {
  ///  Local state fields for this component.

  bool isSwipe = false;

  ///  State fields for stateful widgets in this component.

  // Model for swipeableStacks component.
  late SwipeableStacksModel swipeableStacksModel;

  @override
  void initState(BuildContext context) {
    swipeableStacksModel = createModel(context, () => SwipeableStacksModel());
  }

  @override
  void dispose() {
    swipeableStacksModel.dispose();
  }
}
