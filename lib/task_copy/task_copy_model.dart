import '/flutter_flow/flutter_flow_util.dart';
import 'task_copy_widget.dart' show TaskCopyWidget;
import 'package:flutter/material.dart';

class TaskCopyModel extends FlutterFlowModel<TaskCopyWidget> {
  ///  State fields for stateful widgets in this page.

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
