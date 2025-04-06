import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/count_payment_copy_widget.dart';
import '/components/image_page_view_inicio_widget.dart';
import '/components/naoexistetaskaqui_widget.dart';
import '/flutter_flow/flutter_flow_swipeable_stack.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'swipe_widget.dart' show SwipeWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SwipeModel extends FlutterFlowModel<SwipeWidget> {
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
