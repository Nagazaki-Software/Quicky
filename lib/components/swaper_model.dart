import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'swaper_widget.dart' show SwaperWidget;
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';

class SwaperModel extends FlutterFlowModel<SwaperWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for SwipeableStack widget.
  late CardSwiperController swipeableStackController;
  // Stores action output result for [Backend Call - Create Document] action in SwipeableStack widget.
  ChatRecord? chatCreated;

  @override
  void initState(BuildContext context) {
    swipeableStackController = CardSwiperController();
  }

  @override
  void dispose() {}
}
