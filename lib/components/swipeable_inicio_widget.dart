import '/backend/backend.dart';
import '/components/swipeable_stack_widget.dart';
import '/flutter_flow/flutter_flow_swipeable_stack.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'swipeable_inicio_model.dart';
export 'swipeable_inicio_model.dart';

class SwipeableInicioWidget extends StatefulWidget {
  const SwipeableInicioWidget({
    super.key,
    this.parameter1,
  });

  final List<TasksRecord>? parameter1;

  @override
  State<SwipeableInicioWidget> createState() => _SwipeableInicioWidgetState();
}

class _SwipeableInicioWidgetState extends State<SwipeableInicioWidget> {
  late SwipeableInicioModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SwipeableInicioModel());

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
        final containerVar = widget!.parameter1?.toList() ?? [];

        return FlutterFlowSwipeableStack(
          onSwipeFn: (index) {},
          onLeftSwipe: (index) {},
          onRightSwipe: (index) {},
          onUpSwipe: (index) {},
          onDownSwipe: (index) {},
          itemBuilder: (context, containerVarIndex) {
            final containerVarItem = containerVar[containerVarIndex];
            return SwipeableStackWidget(
              key: Key('Key0af_${containerVarIndex}_of_${containerVar.length}'),
              parameter3: widget!.parameter1,
            );
          },
          itemCount: containerVar.length,
          controller: _model.swipeableStackController,
          loop: false,
          cardDisplayCount: 3,
          scale: 0.9,
        );
      },
    );
  }
}
