import '/flutter_flow/flutter_flow_util.dart';
import 'task_overview_widget.dart' show TaskOverviewWidget;
import 'package:flutter/material.dart';

class TaskOverviewModel extends FlutterFlowModel<TaskOverviewWidget> {
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
