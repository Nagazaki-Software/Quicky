import '/auth/firebase_auth/auth_util.dart';
import '/components/add_social_media_widget.dart';
import '/components/edit_profile_widget.dart';
import '/components/gender_widget.dart';
import '/components/hobbys_widget.dart';
import '/components/nav_bar_homes_copy_copy2_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'teladeeditarperfil_copy2_widget.dart'
    show TeladeeditarperfilCopy2Widget;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TeladeeditarperfilCopy2Model
    extends FlutterFlowModel<TeladeeditarperfilCopy2Widget> {
  ///  State fields for stateful widgets in this page.

  // Model for navBarHomesCopyCopy2 component.
  late NavBarHomesCopyCopy2Model navBarHomesCopyCopy2Model;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {
    navBarHomesCopyCopy2Model =
        createModel(context, () => NavBarHomesCopyCopy2Model());
  }

  @override
  void dispose() {
    navBarHomesCopyCopy2Model.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
