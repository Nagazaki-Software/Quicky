import '/backend/backend.dart';
import '/components/nav_bar_copy_widget.dart';
import '/components/verifiyaccounturgent_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'swipe_tasker_widget.dart' show SwipeTaskerWidget;
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';

class SwipeTaskerModel extends FlutterFlowModel<SwipeTaskerWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for SwipeableStack widget.
  late CardSwiperController swipeableStackController;
  // Stores action output result for [Backend Call - Create Document] action in SwipeableStack widget.
  ChatRecord? msgDocument;
  // Model for verifiyaccounturgent component.
  late VerifiyaccounturgentModel verifiyaccounturgentModel;
  // Model for navBarCopy component.
  late NavBarCopyModel navBarCopyModel;

  @override
  void initState(BuildContext context) {
    swipeableStackController = CardSwiperController();
    verifiyaccounturgentModel =
        createModel(context, () => VerifiyaccounturgentModel());
    navBarCopyModel = createModel(context, () => NavBarCopyModel());
  }

  @override
  void dispose() {
    verifiyaccounturgentModel.dispose();
    navBarCopyModel.dispose();
  }
}
