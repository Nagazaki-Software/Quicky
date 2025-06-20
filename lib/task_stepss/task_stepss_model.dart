import '/flutter_flow/flutter_flow_util.dart';
import 'task_stepss_widget.dart' show TaskStepssWidget;
import 'package:flutter/material.dart';

class TaskStepssModel extends FlutterFlowModel<TaskStepssWidget> {
  ///  State fields for stateful widgets in this page.

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
