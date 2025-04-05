import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'swiper_widget.dart' show SwiperWidget;
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';

class SwiperModel extends FlutterFlowModel<SwiperWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for SwipeableStack widget.
  late CardSwiperController swipeableStackController;
  // Stores action output result for [Backend Call - Create Document] action in SwipeableStack widget.
  ChatRecord? chatCreateds;

  @override
  void initState(BuildContext context) {
    swipeableStackController = CardSwiperController();
  }

  @override
  void dispose() {}
}
