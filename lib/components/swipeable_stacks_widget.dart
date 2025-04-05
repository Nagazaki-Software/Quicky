import '/backend/backend.dart';
import '/components/swipeable_stack_widget.dart';
import '/flutter_flow/flutter_flow_swipeable_stack.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'swipeable_stacks_model.dart';
export 'swipeable_stacks_model.dart';

class SwipeableStacksWidget extends StatefulWidget {
  const SwipeableStacksWidget({super.key, this.parameter1});

  final List<TasksRecord>? parameter1;

  @override
  State<SwipeableStacksWidget> createState() => _SwipeableStacksWidgetState();
}

class _SwipeableStacksWidgetState extends State<SwipeableStacksWidget> {
  late SwipeableStacksModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SwipeableStacksModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        final containerVar = widget.parameter1?.toList() ?? [];

        return FlutterFlowSwipeableStack(
          onSwipeFn: (index, swipeInfo) {
            final dx = swipeInfo.offset.dx;
            final dy = swipeInfo.offset.dy;

            String direction = '';

            if (dx > 0 && dy < 0) {
              direction = 'topRight';
            } else if (dx > 0 && dy > 0) {
              direction = 'bottomRight';
            } else if (dx < 0 && dy < 0) {
              direction = 'topLeft';
            } else if (dx < 0 && dy > 0) {
              direction = 'bottomLeft';
            }

            FFAppState().localX = direction;
          },

          onLeftSwipe: (index) {},
          onRightSwipe: (index) {},
          onUpSwipe: (index) {},
          onDownSwipe: (index) {},

          itemBuilder: (context, containerVarIndex) {
            final containerVarItem = containerVar[containerVarIndex];
            return Stack(
              children: [
                SwipeableStackWidget(
                  key: Key(
                    'Keyxik_${containerVarIndex}_of_${containerVar.length}',
                  ),
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
          cardPadding: EdgeInsets.all(12.0),
        );
      },
    );
  }
}
