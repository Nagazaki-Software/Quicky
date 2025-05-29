import '/components/nav_bar_copy_widget.dart';
import '/components/nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_calendar.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'current_tasks_widget.dart' show CurrentTasksWidget;
import 'package:flutter/material.dart';

class CurrentTasksModel extends FlutterFlowModel<CurrentTasksWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for Calendar widget.
  DateTimeRange? calendarSelectedDay1;
  // Model for navBarCopy component.
  late NavBarCopyModel navBarCopyModel;
  // State field(s) for Calendar widget.
  DateTimeRange? calendarSelectedDay2;
  // Model for navBar component.
  late NavBarModel navBarModel;

  @override
  void initState(BuildContext context) {
    calendarSelectedDay1 = DateTimeRange(
      start: DateTime.now().startOfDay,
      end: DateTime.now().endOfDay,
    );
    navBarCopyModel = createModel(context, () => NavBarCopyModel());
    calendarSelectedDay2 = DateTimeRange(
      start: DateTime.now().startOfDay,
      end: DateTime.now().endOfDay,
    );
    navBarModel = createModel(context, () => NavBarModel());
  }

  @override
  void dispose() {
    navBarCopyModel.dispose();
    navBarModel.dispose();
  }
}
