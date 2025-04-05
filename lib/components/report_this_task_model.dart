import '/flutter_flow/flutter_flow_util.dart';
import 'report_this_task_widget.dart' show ReportThisTaskWidget;
import 'package:flutter/material.dart';

class ReportThisTaskModel extends FlutterFlowModel<ReportThisTaskWidget> {
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
