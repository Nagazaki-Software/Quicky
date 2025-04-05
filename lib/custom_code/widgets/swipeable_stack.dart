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

import '/components/swipeable_stack_widget.dart';
import '/flutter_flow/flutter_flow_swipeable_stack.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'swipeable_stack_model.dart'; // atualizado para refletir o novo nome
export 'swipeable_stack_model.dart';

class SwipeableStack extends StatefulWidget {
  const SwipeableStack({
    super.key,
    this.parameter1,
  });

  final List<TasksRecord>? parameter1;

  @override
  State<SwipeableStack> createState() => _SwipeableStackState();
}

class _SwipeableStackState extends State<SwipeableStack> {
  late SwipeableStackModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SwipeableStackModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final containerVar = widget.parameter1?.toList() ?? [];

    return FlutterFlowSwipeableStack(
      onSwipeFn: (index) {},
      onLeftSwipe: (index) {
        FFAppState().update(() {
          FFAppState().localX = 3.0; // ↖ Esquerda Superior
        });
      },
      onRightSwipe: (index) {
        FFAppState().update(() {
          FFAppState().localX = 1.0; // ↘ Direita Inferior
        });
      },
      onUpSwipe: (index) {
        FFAppState().update(() {
          FFAppState().localX = 2.0; // ↗ Direita Superior
        });
      },
      onDownSwipe: (index) {
        FFAppState().update(() {
          FFAppState().localX = 4.0; // ↙ Esquerda Inferior
        });
      },
      itemBuilder: (context, containerVarIndex) {
        final containerVarItem = containerVar[containerVarIndex];
        return Stack(
          children: [
            SwipeableStackWidget(
              key: Key('Keyxik_${containerVarIndex}_of_${containerVar.length}'),
              parameter3: widget.parameter1,
            ),
          ],
        );
      },
      itemCount: containerVar.length,
      controller: _model.swipeableStackController,
      loop: false,
      cardDisplayCount: 2,
      scale: 0.9,
      threshold: 0.91,
      cardPadding: EdgeInsets.all(12),
    );
  }
}
