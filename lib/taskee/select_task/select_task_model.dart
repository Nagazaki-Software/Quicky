import '/components/navbar_create_tasks_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'select_task_widget.dart' show SelectTaskWidget;
import 'package:flutter/material.dart';

class SelectTaskModel extends FlutterFlowModel<SelectTaskWidget> {
  ///  Local state fields for this page.

  String openPage = 'All';

  ///  State fields for stateful widgets in this page.

  // Model for navbarCreateTasks component.
  late NavbarCreateTasksModel navbarCreateTasksModel;

  @override
  void initState(BuildContext context) {
    navbarCreateTasksModel =
        createModel(context, () => NavbarCreateTasksModel());
  }

  @override
  void dispose() {
    navbarCreateTasksModel.dispose();
  }
}
