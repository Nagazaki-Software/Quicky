// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:flutter_card_swiper/flutter_card_swiper.dart';

class FlutterCardSwiper extends StatefulWidget {
  const FlutterCardSwiper({
    super.key,
    this.width,
    this.height,
    required this.widgetDentroDoSwipe,
  });

  final double? width;
  final double? height;
  final Widget Function() widgetDentroDoSwipe;

  @override
  State<FlutterCardSwiper> createState() => _FlutterCardSwiperState();
}

class _FlutterCardSwiperState extends State<FlutterCardSwiper> {
  final CardSwiperController controller = CardSwiperController();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      child: Column(
        children: [
          Flexible(
            child: CardSwiper(
              controller: controller,
              cardsCount: 3, // Número fictício, ajuste conforme necessário
              onSwipe: _onSwipe,
              onUndo: _onUndo,
              numberOfCardsDisplayed: 2,
              backCardOffset: const Offset(30, 30),
              padding: const EdgeInsets.all(24.0),
              cardBuilder: (
                context,
                index,
                horizontalThresholdPercentage,
                verticalThresholdPercentage,
              ) {
                return widget.widgetDentroDoSwipe();
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Wrap(
              spacing: 12,
              children: [
                FloatingActionButton(
                  heroTag: 'undo',
                  onPressed: controller.undo,
                  child: const Icon(Icons.rotate_left),
                ),
                FloatingActionButton(
                  heroTag: 'left',
                  onPressed: () =>
                      controller.swipe(direction: CardSwiperDirection.left),
                  child: const Icon(Icons.keyboard_arrow_left),
                ),
                FloatingActionButton(
                  heroTag: 'right',
                  onPressed: () =>
                      controller.swipe(direction: CardSwiperDirection.right),
                  child: const Icon(Icons.keyboard_arrow_right),
                ),
                FloatingActionButton(
                  heroTag: 'top',
                  onPressed: () =>
                      controller.swipe(direction: CardSwiperDirection.top),
                  child: const Icon(Icons.keyboard_arrow_up),
                ),
                FloatingActionButton(
                  heroTag: 'bottom',
                  onPressed: () =>
                      controller.swipe(direction: CardSwiperDirection.bottom),
                  child: const Icon(Icons.keyboard_arrow_down),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  bool _onSwipe(
    int previousIndex,
    int? currentIndex,
    CardSwiperDirection direction,
  ) {
    switch (direction) {
      case CardSwiperDirection.left:
        debugPrint('Swiped left');
        break;
      case CardSwiperDirection.right:
        debugPrint('Swiped right');
        break;
      case CardSwiperDirection.top:
        debugPrint('Swiped up');
        break;
      case CardSwiperDirection.bottom:
        debugPrint('Swiped down');
        break;
      case CardSwiperDirection.none:
        break;
    }
    return true;
  }

  bool _onUndo(
    int? previousIndex,
    int currentIndex,
    CardSwiperDirection direction,
  ) {
    debugPrint('Undo swipe: $direction');
    return true;
  }
}
