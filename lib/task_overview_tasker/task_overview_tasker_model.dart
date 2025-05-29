import '/flutter_flow/flutter_flow_util.dart';
import 'task_overview_tasker_widget.dart' show TaskOverviewTaskerWidget;
import 'package:flutter/material.dart';

class TaskOverviewTaskerModel
    extends FlutterFlowModel<TaskOverviewTaskerWidget> {
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
