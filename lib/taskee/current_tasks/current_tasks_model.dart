import '/components/nav_bar_copy_widget.dart';
import '/components/nav_bar_widget.dart';
import '/components/verifiyaccounturgent_widget.dart';
import '/flutter_flow/flutter_flow_calendar.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'current_tasks_widget.dart' show CurrentTasksWidget;
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart'
    show TutorialCoachMark;
import 'package:flutter/material.dart';

class CurrentTasksModel extends FlutterFlowModel<CurrentTasksWidget> {
  ///  Local state fields for this page.

  DateTime? hora;

  ///  State fields for stateful widgets in this page.

  TutorialCoachMark? currentTaskHelpController;
  // Model for verifiyaccounturgent component.
  late VerifiyaccounturgentModel verifiyaccounturgentModel;
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
    verifiyaccounturgentModel =
        createModel(context, () => VerifiyaccounturgentModel());
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
    currentTaskHelpController?.finish();
    verifiyaccounturgentModel.dispose();
    navBarCopyModel.dispose();
    navBarModel.dispose();
  }
}
