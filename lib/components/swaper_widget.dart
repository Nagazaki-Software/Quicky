import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/image_inicio_page_view_widget.dart';
import '/components/notification_widget.dart';
import '/flutter_flow/flutter_flow_swipeable_stack.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'swaper_model.dart';
export 'swaper_model.dart';

class SwaperWidget extends StatefulWidget {
  const SwaperWidget({super.key});

  @override
  State<SwaperWidget> createState() => _SwaperWidgetState();
}

class _SwaperWidgetState extends State<SwaperWidget> {
  late SwaperModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SwaperModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<TasksRecord>>(
      future: queryTasksRecordOnce(),
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
        List<TasksRecord> swipeableStackTasksRecordList = snapshot.data!;

        return FlutterFlowSwipeableStack(
          onSwipeFn: (index) {},
          onLeftSwipe: (index) {},
          onRightSwipe: (index) async {
            final swipeableStackTasksRecord =
                swipeableStackTasksRecordList[index];

            var chatRecordReference = ChatRecord.collection.doc();
            await chatRecordReference.set(createChatRecordData(
              userDocument: currentUserReference,
              imgDoUser: swipeableStackTasksRecord.foto.firstOrNull,
              userName: currentUserDisplayName,
              nomeDoGrupo: 'Task ${swipeableStackTasksRecord.titulo}',
              imgDaTask: swipeableStackTasksRecord.foto.firstOrNull,
              user2Document: swipeableStackTasksRecord.userReference,
              ultimaMsg: getCurrentTimestamp,
              ultMsg: '${currentUserDisplayName} aceitou a task.',
            ));
            _model.chatCreated = ChatRecord.getDocumentFromData(
                createChatRecordData(
                  userDocument: currentUserReference,
                  imgDoUser: swipeableStackTasksRecord.foto.firstOrNull,
                  userName: currentUserDisplayName,
                  nomeDoGrupo: 'Task ${swipeableStackTasksRecord.titulo}',
                  imgDaTask: swipeableStackTasksRecord.foto.firstOrNull,
                  user2Document: swipeableStackTasksRecord.userReference,
                  ultimaMsg: getCurrentTimestamp,
                  ultMsg: '${currentUserDisplayName} aceitou a task.',
                ),
                chatRecordReference);

            await ChatHistoryRecord.createDoc(_model.chatCreated!.reference)
                .set(createChatHistoryRecordData(
              msgdosystema: true,
              msg: '${currentUserDisplayName} aceitou a task.',
              horario: getCurrentTimestamp,
              documentUser: currentUserReference,
            ));
            await showModalBottomSheet(
              isScrollControlled: true,
              backgroundColor: Colors.transparent,
              enableDrag: false,
              context: context,
              builder: (context) {
                return Padding(
                  padding: MediaQuery.viewInsetsOf(context),
                  child: NotificationWidget(),
                );
              },
            ).then((value) => safeSetState(() {}));

            FFAppState().taskReference = swipeableStackTasksRecord.reference;
            FFAppState().update(() {});

            safeSetState(() {});
          },
          onUpSwipe: (index) {},
          onDownSwipe: (index) {},
          itemBuilder: (context, swipeableStackIndex) {
            final swipeableStackTasksRecord =
                swipeableStackTasksRecordList[swipeableStackIndex];
            return Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: ImageInicioPageViewWidget(
                    key: Key(
                        'Keyr6o_${swipeableStackIndex}_of_${swipeableStackTasksRecordList.length}'),
                    parameter3: swipeableStackTasksRecord.reference,
                  ),
                ),
              ],
            );
          },
          itemCount: swipeableStackTasksRecordList.length,
          controller: _model.swipeableStackController,
          loop: false,
          cardDisplayCount: valueOrDefault<int>(
            swipeableStackTasksRecordList.length,
            0,
          ),
          scale: 1.0,
          cardPadding: EdgeInsets.all(5.0),
          backCardOffset: const Offset(0.0, 0.0),
        );
      },
    );
  }
}
