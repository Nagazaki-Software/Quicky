import '/components/swipe_mapes_widget.dart';
import '/components/swipe_page_view_widget.dart';
import '/components/textfield_swipe_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'card_swipead_widget.dart' show CardSwipeadWidget;
import 'package:flutter/material.dart';

class CardSwipeadModel extends FlutterFlowModel<CardSwipeadWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for swipePageView component.
  late SwipePageViewModel swipePageViewModel;
  // Model for swipeMapes component.
  late SwipeMapesModel swipeMapesModel;
  // Model for textfieldSwipe component.
  late TextfieldSwipeModel textfieldSwipeModel;

  @override
  void initState(BuildContext context) {
    swipePageViewModel = createModel(context, () => SwipePageViewModel());
    swipeMapesModel = createModel(context, () => SwipeMapesModel());
    textfieldSwipeModel = createModel(context, () => TextfieldSwipeModel());
  }

  @override
  void dispose() {
    swipePageViewModel.dispose();
    swipeMapesModel.dispose();
    textfieldSwipeModel.dispose();
  }
}
