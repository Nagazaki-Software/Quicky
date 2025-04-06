import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/nav_bar_homes_copy_copy_widget.dart';
import '/components/nav_bar_tinder_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'chat_model.dart';
export 'chat_model.dart';

/// pagina inicial com swipeableStack e navbar
class ChatWidget extends StatefulWidget {
  const ChatWidget({super.key});

  static String routeName = 'chat';
  static String routePath = '/chat';

  @override
  State<ChatWidget> createState() => _ChatWidgetState();
}

class _ChatWidgetState extends State<ChatWidget> {
  late ChatModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChatModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          body: SafeArea(
            top: true,
            child: Stack(
              children: [
                StreamBuilder<List<ChatRecord>>(
                  stream: queryChatRecord(
                    queryBuilder: (chatRecord) => chatRecord.where(Filter.or(
                      Filter(
                        'userDocument',
                        isEqualTo: currentUserReference,
                      ),
                      Filter(
                        'user2Document',
                        isEqualTo: currentUserReference,
                      ),
                    )),
                    singleRecord: true,
                  ),
                  builder: (context, snapshot) {
                    // Customize what your widget looks like when it's loading.
                    if (!snapshot.hasData) {
                      return Center(
                        child: SizedBox(
                          width: 50.0,
                          height: 50.0,
                          child: SpinKitFadingCube(
                            color: FlutterFlowTheme.of(context).primary,
                            size: 50.0,
                          ),
                        ),
                      );
                    }
                    List<ChatRecord> columnChatRecordList = snapshot.data!;
                    final columnChatRecord = columnChatRecordList.isNotEmpty
                        ? columnChatRecordList.first
                        : null;

                    return SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              wrapWithModel(
                                model: _model.navBarHomesCopyCopyModel,
                                updateCallback: () => safeSetState(() {}),
                                child: NavBarHomesCopyCopyWidget(),
                              ),
                            ],
                          ),
                          if (!(columnChatRecord != null))
                            Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Text(
                                'No conversations or tasks.',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ),
                        ],
                      ),
                    );
                  },
                ),
                Align(
                  alignment: AlignmentDirectional(0.0, 1.0),
                  child: Stack(
                    children: [
                      wrapWithModel(
                        model: _model.navBarTinderModel,
                        updateCallback: () => safeSetState(() {}),
                        child: NavBarTinderWidget(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
