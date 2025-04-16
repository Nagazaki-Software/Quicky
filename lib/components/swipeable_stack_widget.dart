import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/count_payment_copy_widget.dart';
import '/components/image_page_view_inicio_widget.dart';
import '/components/naoexistetaskaqui_widget.dart';
import '/flutter_flow/flutter_flow_swipeable_stack.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'swipeable_stack_model.dart';
export 'swipeable_stack_model.dart';

class SwipeableStackWidget extends StatefulWidget {
  const SwipeableStackWidget({
    super.key,
    this.parameter3,
  });

  final List<TasksRecord>? parameter3;

  @override
  State<SwipeableStackWidget> createState() => _SwipeableStackWidgetState();
}

class _SwipeableStackWidgetState extends State<SwipeableStackWidget> {
  late SwipeableStackModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SwipeableStackModel());

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
                    widget.parameter3!.toList(),
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
                  child: FutureBuilder<TasksRecord>(
                    future:
                        TasksRecord.getDocumentOnce(containerVarItem.reference),
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
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          ImagePageViewInicioWidget(
                            key: Key(
                                'Keydah_${containerVarIndex}_of_${containerVar.length}'),
                            parameter2: columnTasksRecord.reference,
                          ),
                        ],
                      );
                    },
                  ),
                );
              },
              itemCount: containerVar.length,
              controller: _model.swipeableStackController,
              loop: false,
              cardDisplayCount: 2,
              scale: 0.91,
              threshold: 0.9,
              maxAngle: 90.0,
              cardPadding: EdgeInsets.all(12.0),
              backCardOffset: const Offset(10.0, 0.0),
            );
          },
        ),
      ),
    );
  }
}
