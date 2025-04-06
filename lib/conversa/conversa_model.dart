import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/chat_componente_widget.dart';
import '/components/renegociar_proposta_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/request_manager.dart';

import '/index.dart';
import 'conversa_widget.dart' show ConversaWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ConversaModel extends FlutterFlowModel<ConversaWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for Column widget.
  ScrollController? columnController;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  /// Query cache managers for this widget.

  final _queryConversaManager = StreamRequestManager<List<ChatHistoryRecord>>();
  Stream<List<ChatHistoryRecord>> queryConversa({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<ChatHistoryRecord>> Function() requestFn,
  }) =>
      _queryConversaManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearQueryConversaCache() => _queryConversaManager.clear();
  void clearQueryConversaCacheKey(String? uniqueKey) =>
      _queryConversaManager.clearRequest(uniqueKey);

  @override
  void initState(BuildContext context) {
    columnController = ScrollController();
  }

  @override
  void dispose() {
    columnController?.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();

    /// Dispose query cache managers for this widget.

    clearQueryConversaCache();
  }
}
