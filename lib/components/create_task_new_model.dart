import '/flutter_flow/flutter_flow_util.dart';
import 'create_task_new_widget.dart' show CreateTaskNewWidget;
import 'package:flutter/material.dart';

class CreateTaskNewModel extends FlutterFlowModel<CreateTaskNewWidget> {
  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Gemini - Generate Text] action in createTaskNew widget.
  String? gemini;
  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
