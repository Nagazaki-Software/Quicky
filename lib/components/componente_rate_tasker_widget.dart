import '/backend/backend.dart';
import '/components/rate_this_task_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'componente_rate_tasker_model.dart';
export 'componente_rate_tasker_model.dart';

class ComponenteRateTaskerWidget extends StatefulWidget {
  const ComponenteRateTaskerWidget({
    super.key,
    required this.taskReference,
    required this.userReference,
  });

  final DocumentReference? taskReference;
  final DocumentReference? userReference;

  @override
  State<ComponenteRateTaskerWidget> createState() =>
      _ComponenteRateTaskerWidgetState();
}

class _ComponenteRateTaskerWidgetState
    extends State<ComponenteRateTaskerWidget> {
  late ComponenteRateTaskerModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ComponenteRateTaskerModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<UsersRecord>(
      future: UsersRecord.getDocumentOnce(widget.userReference!),
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

        final stackUsersRecord = snapshot.data!;

        return Stack(
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
              child: Container(
                width: double.infinity,
                height: 60.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 4.0,
                      color: Color(0x33000000),
                      offset: Offset(
                        0.0,
                        2.0,
                      ),
                    )
                  ],
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Rate Tasker',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              font: GoogleFonts.readexPro(
                                fontWeight: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontStyle,
                              ),
                              letterSpacing: 0.0,
                              fontWeight: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontWeight,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            child: RatingBar.builder(
                              onRatingUpdate: (newValue) async {
                                safeSetState(
                                    () => _model.ratingBarValue = newValue);
                                await showModalBottomSheet(
                                  isScrollControlled: true,
                                  backgroundColor: Colors.transparent,
                                  enableDrag: false,
                                  context: context,
                                  builder: (context) {
                                    return Padding(
                                      padding: MediaQuery.viewInsetsOf(context),
                                      child: RateThisTaskWidget(
                                        rating: valueOrDefault<int>(
                                          _model.ratingBarValue?.round(),
                                          0,
                                        ),
                                        userReference: widget.userReference!,
                                        taskReference: widget.taskReference!,
                                      ),
                                    );
                                  },
                                ).then((value) => safeSetState(() {}));
                              },
                              itemBuilder: (context, index) => Icon(
                                Icons.star_rounded,
                                color: FlutterFlowTheme.of(context).primary,
                              ),
                              direction: Axis.horizontal,
                              initialRating: _model.ratingBarValue ??=
                                  valueOrDefault<double>(
                                (stackUsersRecord.avaliacoes.length == null
                                        ? 3
                                        : valueOrDefault<int>(
                                            functions.calcularRatings(
                                                stackUsersRecord.avaliacoes
                                                    .toList()),
                                            0,
                                          ))
                                    .toDouble(),
                                3.0,
                              ),
                              unratedColor: Color(0xFFB9AC92),
                              itemCount: 5,
                              itemSize: 24.0,
                              glowColor: FlutterFlowTheme.of(context).primary,
                            ),
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(-1.0, 1.0),
                                    child: Stack(
                                      alignment:
                                          AlignmentDirectional(1.0, -1.0),
                                      children: [
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 1.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 20.0, 0.0),
                                            child: Container(
                                              width: 20.0,
                                              height: 20.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                shape: BoxShape.circle,
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  width: 1.0,
                                                ),
                                              ),
                                              alignment: AlignmentDirectional(
                                                  0.0, 1.0),
                                              child: Stack(
                                                children: [
                                                  if (stackUsersRecord
                                                              .avaliacoes
                                                              .elementAtOrNull(
                                                                  1)
                                                              ?.fotodouser !=
                                                          null &&
                                                      stackUsersRecord
                                                              .avaliacoes
                                                              .elementAtOrNull(
                                                                  1)
                                                              ?.fotodouser !=
                                                          '')
                                                    Container(
                                                      width: 200.0,
                                                      height: 200.0,
                                                      clipBehavior:
                                                          Clip.antiAlias,
                                                      decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                      ),
                                                      child: Image.network(
                                                        stackUsersRecord
                                                            .avaliacoes
                                                            .elementAtOrNull(1)!
                                                            .fotodouser,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  if (stackUsersRecord
                                                              .avaliacoes
                                                              .elementAtOrNull(
                                                                  1)
                                                              ?.fotodouser ==
                                                          null ||
                                                      stackUsersRecord
                                                              .avaliacoes
                                                              .elementAtOrNull(
                                                                  1)
                                                              ?.fotodouser ==
                                                          '')
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: FaIcon(
                                                        FontAwesomeIcons
                                                            .question,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        size: 10.0,
                                                      ),
                                                    ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 2.0, 0.0, 15.0),
                                          child: Container(
                                            width: 24.0,
                                            height: 24.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                width: 1.0,
                                              ),
                                            ),
                                            child: Stack(
                                              children: [
                                                if (stackUsersRecord.avaliacoes
                                                            .elementAtOrNull(2)
                                                            ?.fotodouser !=
                                                        null &&
                                                    stackUsersRecord.avaliacoes
                                                            .elementAtOrNull(2)
                                                            ?.fotodouser !=
                                                        '')
                                                  Container(
                                                    width: 200.0,
                                                    height: 200.0,
                                                    clipBehavior:
                                                        Clip.antiAlias,
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                    ),
                                                    child: Image.network(
                                                      stackUsersRecord
                                                          .avaliacoes
                                                          .elementAtOrNull(2)!
                                                          .fotodouser,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                if (stackUsersRecord.avaliacoes
                                                            .elementAtOrNull(2)
                                                            ?.fotodouser ==
                                                        null ||
                                                    stackUsersRecord.avaliacoes
                                                            .elementAtOrNull(2)
                                                            ?.fotodouser ==
                                                        '')
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: FaIcon(
                                                      FontAwesomeIcons.question,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      size: 10.0,
                                                    ),
                                                  ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional(-1.0, 1.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 15.0, 0.0, 0.0),
                                            child: Stack(
                                              alignment: AlignmentDirectional(
                                                  -1.0, 1.0),
                                              children: [
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          -1.0, 1.0),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(15.0, 4.0,
                                                                2.0, 0.0),
                                                    child: Container(
                                                      width: 20.0,
                                                      height: 20.0,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        shape: BoxShape.circle,
                                                        border: Border.all(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          width: 1.0,
                                                        ),
                                                      ),
                                                      alignment:
                                                          AlignmentDirectional(
                                                              -1.0, 1.0),
                                                      child: Stack(
                                                        children: [
                                                          if (stackUsersRecord
                                                                      .avaliacoes
                                                                      .elementAtOrNull(
                                                                          3)
                                                                      ?.fotodouser !=
                                                                  null &&
                                                              stackUsersRecord
                                                                      .avaliacoes
                                                                      .elementAtOrNull(
                                                                          3)
                                                                      ?.fotodouser !=
                                                                  '')
                                                            Container(
                                                              width: 200.0,
                                                              height: 200.0,
                                                              clipBehavior: Clip
                                                                  .antiAlias,
                                                              decoration:
                                                                  BoxDecoration(
                                                                shape: BoxShape
                                                                    .circle,
                                                              ),
                                                              child:
                                                                  Image.network(
                                                                stackUsersRecord
                                                                    .avaliacoes
                                                                    .elementAtOrNull(
                                                                        3)!
                                                                    .fotodouser,
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                          if (stackUsersRecord
                                                                      .avaliacoes
                                                                      .elementAtOrNull(
                                                                          3)
                                                                      ?.fotodouser ==
                                                                  null ||
                                                              stackUsersRecord
                                                                      .avaliacoes
                                                                      .elementAtOrNull(
                                                                          3)
                                                                      ?.fotodouser ==
                                                                  '')
                                                            Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      0.0, 0.0),
                                                              child: FaIcon(
                                                                FontAwesomeIcons
                                                                    .question,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                size: 10.0,
                                                              ),
                                                            ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 16.0, 21.0, 0.0),
                                          child: Container(
                                            width: 16.0,
                                            height: 16.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                width: 1.0,
                                              ),
                                            ),
                                            child: Stack(
                                              children: [
                                                if (stackUsersRecord.avaliacoes
                                                            .elementAtOrNull(0)
                                                            ?.fotodouser !=
                                                        null &&
                                                    stackUsersRecord.avaliacoes
                                                            .elementAtOrNull(0)
                                                            ?.fotodouser !=
                                                        '')
                                                  Container(
                                                    width: 200.0,
                                                    height: 200.0,
                                                    clipBehavior:
                                                        Clip.antiAlias,
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                    ),
                                                    child: Image.network(
                                                      stackUsersRecord
                                                          .avaliacoes
                                                          .elementAtOrNull(0)!
                                                          .fotodouser,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                if (stackUsersRecord.avaliacoes
                                                            .elementAtOrNull(0)
                                                            ?.fotodouser ==
                                                        null ||
                                                    stackUsersRecord.avaliacoes
                                                            .elementAtOrNull(0)
                                                            ?.fotodouser ==
                                                        '')
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: FaIcon(
                                                      FontAwesomeIcons.question,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      size: 10.0,
                                                    ),
                                                  ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional(-1.0, 1.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 22.0, 0.0),
                                            child: Container(
                                              height: MediaQuery.sizeOf(context)
                                                      .height *
                                                  0.046,
                                              child: Stack(
                                                alignment: AlignmentDirectional(
                                                    -1.0, 1.0),
                                                children: [
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            -1.0, 1.0),
                                                    child: Text(
                                                      '${valueOrDefault<String>(
                                                            stackUsersRecord
                                                                .avaliacoes
                                                                .length
                                                                .toString(),
                                                            '0',
                                                          ) != '' ? valueOrDefault<String>(
                                                          stackUsersRecord
                                                              .avaliacoes.length
                                                              .toString(),
                                                          '0',
                                                        ) : 'No'} Ratings',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                font: GoogleFonts
                                                                    .readexPro(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                                fontSize: 6.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                              ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ].divide(SizedBox(width: 30.0)),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
