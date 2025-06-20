import '/backend/backend.dart';
import '/components/nav_bar_copy_widget.dart';
import '/components/nav_bar_widget.dart';
import '/components/verifiyaccounturgent_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'swipe_tasker_widget.dart' show SwipeTaskerWidget;
import 'package:flutter/material.dart';

class SwipeTaskerModel extends FlutterFlowModel<SwipeTaskerWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Create Document] action in FlutterTaskSwiper widget.
  ChatRecord? chat;
  // Model for verifiyaccounturgent component.
  late VerifiyaccounturgentModel verifiyaccounturgentModel;
  // Model for navBarCopy component.
  late NavBarCopyModel navBarCopyModel;
  // Model for navBar component.
  late NavBarModel navBarModel;

  @override
  void initState(BuildContext context) {
    verifiyaccounturgentModel =
        createModel(context, () => VerifiyaccounturgentModel());
    navBarCopyModel = createModel(context, () => NavBarCopyModel());
    navBarModel = createModel(context, () => NavBarModel());
  }

  @override
  void dispose() {
    verifiyaccounturgentModel.dispose();
    navBarCopyModel.dispose();
    navBarModel.dispose();
  }
}
