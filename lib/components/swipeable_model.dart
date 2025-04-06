import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/count_payment_copy_widget.dart';
import '/components/image_inicio_page_view_widget.dart';
import '/components/naoexistetaskaqui_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_swipeable_stack.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:math';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'swipeable_widget.dart' show SwipeableWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SwipeableModel extends FlutterFlowModel<SwipeableWidget> {
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
