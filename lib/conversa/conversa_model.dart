import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/request_manager.dart';

import '/index.dart';
import 'conversa_widget.dart' show ConversaWidget;
import 'package:flutter/material.dart';

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
