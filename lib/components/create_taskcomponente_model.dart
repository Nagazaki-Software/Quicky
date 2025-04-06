import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/chooseyourcategoy_copy_widget.dart';
import '/components/chooseyourcategoy_widget.dart';
import '/components/component_presencial_ou_remoto_widget.dart';
import '/components/componente_instrucoes_especial_widget.dart';
import '/components/componente_materiais_necessarios_widget.dart';
import '/components/count_payment_widget.dart';
import '/components/fotoprimeirocontainer_widget.dart';
import '/components/naoexitefotosaquiadicone_widget.dart';
import '/components/order_detaislew_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_place_picker.dart';
import '/flutter_flow/flutter_flow_swipeable_stack.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/instant_timer.dart';
import '/flutter_flow/place.dart';
import 'dart:io';
import 'dart:math';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/random_data_util.dart' as random_data;
import 'create_taskcomponente_widget.dart' show CreateTaskcomponenteWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CreateTaskcomponenteModel
    extends FlutterFlowModel<CreateTaskcomponenteWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  InstantTimer? instantTimer;
  // Stores action output result for [Backend Call - Create Document] action in Text widget.
  TasksRecord? createTask;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  String? _textController1Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  String? _textController2Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for GoogleMap widget.
  LatLng? googleMapsCenter;
  final googleMapsController = Completer<GoogleMapController>();
  // State field(s) for PlacePicker widget.
  FFPlace placePickerValue = FFPlace();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode3;
  TextEditingController? textController3;
  String? Function(BuildContext, String?)? textController3Validator;
  DateTime? datePicked1;
  DateTime? datePicked2;
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController1;
  String? get choiceChipsValue1 =>
      choiceChipsValueController1?.value?.firstOrNull;
  set choiceChipsValue1(String? val) =>
      choiceChipsValueController1?.value = val != null ? [val] : [];
  // State field(s) for Switch widget.
  bool? switchValue;
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController2;
  String? get choiceChipsValue2 =>
      choiceChipsValueController2?.value?.firstOrNull;
  set choiceChipsValue2(String? val) =>
      choiceChipsValueController2?.value = val != null ? [val] : [];
  // State field(s) for SwipeableStack widget.
  late CardSwiperController swipeableStackController;
  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;

  @override
  void initState(BuildContext context) {
    textController1Validator = _textController1Validator;
    textController2Validator = _textController2Validator;
    swipeableStackController = CardSwiperController();
  }

  @override
  void dispose() {
    instantTimer?.cancel();
    tabBarController?.dispose();
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();

    textFieldFocusNode3?.dispose();
    textController3?.dispose();
  }
}
