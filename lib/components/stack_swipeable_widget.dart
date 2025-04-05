import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'stack_swipeable_model.dart';
export 'stack_swipeable_model.dart';

class StackSwipeableWidget extends StatefulWidget {
  const StackSwipeableWidget({super.key});

  @override
  State<StackSwipeableWidget> createState() => _StackSwipeableWidgetState();
}

class _StackSwipeableWidgetState extends State<StackSwipeableWidget> {
  late StackSwipeableModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => StackSwipeableModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(0.0, -1.0),
      child: Container(
        height: MediaQuery.sizeOf(context).height * 0.7,
        child: Stack(
          alignment: AlignmentDirectional(0.0, -1.0),
          children: [],
        ),
      ),
    );
  }
}
