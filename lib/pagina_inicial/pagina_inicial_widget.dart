import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/all_chats_comp_widget.dart';
import '/components/componenteperfil_widget.dart';
import '/components/create_taskcomponente_widget.dart';
import '/components/explore_componente_widget.dart';
import '/components/nav_bar_homes_widget.dart';
import '/components/nav_bar_tinder_widget.dart';
import '/components/paginainicial_componente_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'pagina_inicial_model.dart';
export 'pagina_inicial_model.dart';

/// pagina inicial com swipeableStack e navbar
class PaginaInicialWidget extends StatefulWidget {
  const PaginaInicialWidget({super.key});

  static String routeName = 'PaginaInicial';
  static String routePath = '/paginaInicial';

  @override
  State<PaginaInicialWidget> createState() => _PaginaInicialWidgetState();
}

class _PaginaInicialWidgetState extends State<PaginaInicialWidget>
    with TickerProviderStateMixin {
  late PaginaInicialModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng? currentUserLocationValue;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PaginaInicialModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      currentUserLocationValue =
          await getCurrentUserLocation(defaultLocation: LatLng(0.0, 0.0));
      if (currentUserDocument?.location == null) {
        await currentUserReference!.update(createUsersRecordData(
          location: currentUserLocationValue,
        ));
      }
    });

    animationsMap.addAll({
      'createTaskcomponenteOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.linear,
            delay: 0.0.ms,
            duration: 400.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'exploreComponenteOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.linear,
            delay: 0.0.ms,
            duration: 420.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 420.0.ms,
            duration: 350.0.ms,
            begin: Offset(0.0, -10.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
      'allChatsCompOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'paginainicialComponenteOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOutQuint,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'componenteperfilOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 400.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          key: scaffoldKey,
          resizeToAvoidBottomInset: false,
          backgroundColor: Color(0xFF161617),
          appBar: FFAppState().pages != 'Criar task'
              ? PreferredSize(
                  preferredSize: Size.fromHeight(35.0),
                  child: AppBar(
                    backgroundColor: Color(0xF6FFFFFF),
                    automaticallyImplyLeading: false,
                    actions: [],
                    flexibleSpace: FlexibleSpaceBar(
                      title: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Align(
                            alignment: AlignmentDirectional(0.0, 1.0),
                            child: wrapWithModel(
                              model: _model.navBarHomesModel,
                              updateCallback: () => safeSetState(() {}),
                              child: NavBarHomesWidget(),
                            ),
                          ),
                        ],
                      ),
                      centerTitle: true,
                      expandedTitleScale: 1.0,
                    ),
                    elevation: 2.0,
                  ),
                )
              : null,
          body: SafeArea(
            top: true,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    child: Stack(
                      alignment: AlignmentDirectional(0.0, -1.0),
                      children: [
                        Container(
                          width: double.infinity,
                          height: MediaQuery.sizeOf(context).height * 1.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              if (FFAppState().pages == 'Criar task')
                                Expanded(
                                  child: wrapWithModel(
                                    model: _model.createTaskcomponenteModel,
                                    updateCallback: () => safeSetState(() {}),
                                    child: CreateTaskcomponenteWidget(),
                                  ).animateOnPageLoad(animationsMap[
                                      'createTaskcomponenteOnPageLoadAnimation']!),
                                ),
                              if (FFAppState().pages == 'Explorer')
                                Expanded(
                                  child: wrapWithModel(
                                    model: _model.exploreComponenteModel,
                                    updateCallback: () => safeSetState(() {}),
                                    child: ExploreComponenteWidget(),
                                  ).animateOnPageLoad(animationsMap[
                                      'exploreComponenteOnPageLoadAnimation']!),
                                ),
                              if (FFAppState().pages == 'Chat')
                                StreamBuilder<List<ChatRecord>>(
                                  stream: queryChatRecord(
                                    queryBuilder: (chatRecord) =>
                                        chatRecord.where(Filter.or(
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
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            size: 50.0,
                                          ),
                                        ),
                                      );
                                    }
                                    List<ChatRecord> columnChatRecordList =
                                        snapshot.data!;
                                    final columnChatRecord =
                                        columnChatRecordList.isNotEmpty
                                            ? columnChatRecordList.first
                                            : null;

                                    return Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        if (columnChatRecord != null)
                                          Expanded(
                                            child: wrapWithModel(
                                              model: _model.allChatsCompModel,
                                              updateCallback: () =>
                                                  safeSetState(() {}),
                                              updateOnChange: true,
                                              child: AllChatsCompWidget(
                                                parameter2: false,
                                              ),
                                            ).animateOnPageLoad(animationsMap[
                                                'allChatsCompOnPageLoadAnimation']!),
                                          ),
                                        if (!(columnChatRecord != null))
                                          Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: Text(
                                              'No conversations or tasks.',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Readex Pro',
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ),
                                      ],
                                    );
                                  },
                                ),
                              if (FFAppState().pages == 'Pagina inicial')
                                Expanded(
                                  child: wrapWithModel(
                                    model: _model.paginainicialComponenteModel,
                                    updateCallback: () => safeSetState(() {}),
                                    child: PaginainicialComponenteWidget(),
                                  ).animateOnPageLoad(animationsMap[
                                      'paginainicialComponenteOnPageLoadAnimation']!),
                                ),
                              if (FFAppState().pages == 'Perfil')
                                Expanded(
                                  child: wrapWithModel(
                                    model: _model.componenteperfilModel,
                                    updateCallback: () => safeSetState(() {}),
                                    child: ComponenteperfilWidget(),
                                  ).animateOnPageLoad(animationsMap[
                                      'componenteperfilOnPageLoadAnimation']!),
                                ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SafeArea(
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).primaryText,
                    ),
                    alignment: AlignmentDirectional(0.0, 1.0),
                    child: Align(
                      alignment: AlignmentDirectional(0.0, 1.0),
                      child: wrapWithModel(
                        model: _model.navBarTinderModel,
                        updateCallback: () => safeSetState(() {}),
                        child: NavBarTinderWidget(),
                      ),
                    ),
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
