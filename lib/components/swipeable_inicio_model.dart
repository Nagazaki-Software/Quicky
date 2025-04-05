import '/flutter_flow/flutter_flow_util.dart';
import 'swipeable_inicio_widget.dart' show SwipeableInicioWidget;
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';

class SwipeableInicioModel extends FlutterFlowModel<SwipeableInicioWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for SwipeableStack widget.
  late CardSwiperController swipeableStackController;

  @override
  void initState(BuildContext context) {
    swipeableStackController = CardSwiperController();
  }

  @override
  void dispose() {}
}
