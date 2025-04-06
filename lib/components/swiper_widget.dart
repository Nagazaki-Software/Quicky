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
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'swiper_model.dart';
export 'swiper_model.dart';

class SwiperWidget extends StatefulWidget {
  const SwiperWidget({
    super.key,
    this.parameter1,
    this.parameter2,
    this.parameter3,
    this.parameter4,
    this.parameter5,
    this.parameter6,
    this.parameter7,
    this.parameter8,
    this.parameter9,
    this.parameter10,
    this.parameter11,
  });

  final List<String>? parameter1;
  final String? parameter2;
  final String? parameter3;
  final DocumentReference? parameter4;
  final int? parameter5;
  final List<TasksRecord>? parameter6;
  final String? parameter7;
  final String? parameter8;
  final DocumentReference? parameter9;
  final DocumentReference? parameter10;
  final DocumentReference? parameter11;

  @override
  State<SwiperWidget> createState() => _SwiperWidgetState();
}

class _SwiperWidgetState extends State<SwiperWidget> {
  late SwiperModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SwiperModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Align(
      alignment: AlignmentDirectional(0.0, -1.0),
      child: AuthUserStreamWidget(
        builder: (context) => Builder(
          builder: (context) {
            final containerVar = functions
                .buscarRegiao(
                    widget!.parameter6!.toList(),
                    currentUserDocument!.location!,
                    50.0,
                    FFAppState().priceFilter.toDouble())
                .toList();
            if (containerVar.isEmpty) {
              return Center(
                child: NaoexistetaskaquiWidget(),
              );
            }

            return FlutterFlowSwipeableStack(
              onSwipeFn: (index) {},
              onLeftSwipe: (index) {},
              onRightSwipe: (index) async {
                final containerVarItem = containerVar[index];

                var chatRecordReference = ChatRecord.collection.doc();
                await chatRecordReference.set(createChatRecordData(
                  userDocument: currentUserReference,
                  imgDoUser: containerVarItem.foto.firstOrNull,
                  userName: currentUserDisplayName,
                  nomeDoGrupo: 'Task ${containerVarItem.titulo}',
                  imgDaTask: containerVarItem.foto.firstOrNull,
                  user2Document: containerVarItem.userReference,
                  ultimaMsg: getCurrentTimestamp,
                  ultMsg: '${currentUserDisplayName} accept this task.',
                  referenceTask: containerVarItem.reference,
                ));
                _model.chatCreateds = ChatRecord.getDocumentFromData(
                    createChatRecordData(
                      userDocument: currentUserReference,
                      imgDoUser: containerVarItem.foto.firstOrNull,
                      userName: currentUserDisplayName,
                      nomeDoGrupo: 'Task ${containerVarItem.titulo}',
                      imgDaTask: containerVarItem.foto.firstOrNull,
                      user2Document: containerVarItem.userReference,
                      ultimaMsg: getCurrentTimestamp,
                      ultMsg: '${currentUserDisplayName} accept this task.',
                      referenceTask: containerVarItem.reference,
                    ),
                    chatRecordReference);

                await ChatHistoryRecord.createDoc(
                        _model.chatCreateds!.reference)
                    .set(createChatHistoryRecordData(
                  msgdosystema: true,
                  msg: '${currentUserDisplayName} accept this task.',
                  horario: getCurrentTimestamp,
                  documentUser: currentUserReference,
                ));

                await containerVarItem.reference.update({
                  ...mapToFirestore(
                    {
                      'usuariosDisputandoPelaTask':
                          FieldValue.arrayUnion([currentUserReference]),
                    },
                  ),
                });
                FFAppState().taskReference = containerVarItem.reference;
                FFAppState().update(() {});

                safeSetState(() {});
              },
              onUpSwipe: (index) async {
                final containerVarItem = containerVar[index];
                await showModalBottomSheet(
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  enableDrag: false,
                  context: context,
                  builder: (context) {
                    return Padding(
                      padding: MediaQuery.viewInsetsOf(context),
                      child: CountPaymentCopyWidget(
                        task: containerVarItem.reference,
                      ),
                    );
                  },
                ).then((value) => safeSetState(() {}));
              },
              onDownSwipe: (index) {},
              itemBuilder: (context, containerVarIndex) {
                final containerVarItem = containerVar[containerVarIndex];
                return Align(
                  alignment: AlignmentDirectional(0.0, -1.0),
                  child: Container(
                    width: double.infinity,
                    height: MediaQuery.sizeOf(context).height * 0.65,
                    child: Stack(
                      children: [
                        FutureBuilder<TasksRecord>(
                          future: TasksRecord.getDocumentOnce(
                              containerVarItem.reference),
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

                            final columnTasksRecord = snapshot.data!;

                            return Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ImagePageViewInicioWidget(
                                  key: Key(
                                      'Key3s1_${containerVarIndex}_of_${containerVar.length}'),
                                  parameter1: columnTasksRecord.titulo,
                                  parameter2: columnTasksRecord.reference,
                                  parameter3: containerVarItem.foto,
                                  parameter4: functions.formatStringInter(
                                      containerVarItem.valor),
                                  parameter5: columnTasksRecord.foto,
                                  parameter6: valueOrDefault<String>(
                                    columnTasksRecord.pagamentoPrecos
                                        .toString(),
                                    '0',
                                  ),
                                  parameter7: columnTasksRecord.descricao,
                                  parameter8: containerVarIndex.toString(),
                                  parameter9: columnTasksRecord.categoria,
                                  parameter10: columnTasksRecord.modalidade,
                                  parameter11: columnTasksRecord.nivelTrabalho,
                                  parameter12:
                                      columnTasksRecord.materiaisNecessarios,
                                  parameter13: columnTasksRecord.userReference,
                                ),
                              ],
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
              itemCount: containerVar.length,
              controller: _model.swipeableStackController,
              loop: false,
              cardDisplayCount: widget!.parameter5!,
              scale: 1.0,
              cardPadding: EdgeInsets.all(0.0),
            );
          },
        ),
      ),
    );
  }
}
