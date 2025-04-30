import '/flutter_flow/flutter_flow_util.dart';
import 'edit_task_price_widget.dart' show EditTaskPriceWidget;
import 'package:flutter/material.dart';

class EditTaskPriceModel extends FlutterFlowModel<EditTaskPriceWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
