import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/allfilters_widget.dart';
import '/components/chooseyourcategoy_copy_widget.dart';
import '/components/filter_distance_widget.dart';
import '/components/pricefilter_widget.dart';
import '/components/swipeable_stack_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:math';
import 'dart:ui';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'paginainicial_componente_widget.dart'
    show PaginainicialComponenteWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PaginainicialComponenteModel
    extends FlutterFlowModel<PaginainicialComponenteWidget> {
  ///  Local state fields for this component.

  bool isSwipe = false;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
