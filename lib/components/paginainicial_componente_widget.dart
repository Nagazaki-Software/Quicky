import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/ciruclarphotowithborder_widget.dart';
import '/components/widget_pagina_inicial_filters_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'paginainicial_componente_model.dart';
export 'paginainicial_componente_model.dart';

class PaginainicialComponenteWidget extends StatefulWidget {
  const PaginainicialComponenteWidget({super.key});

  @override
  State<PaginainicialComponenteWidget> createState() =>
      _PaginainicialComponenteWidgetState();
}

class _PaginainicialComponenteWidgetState
    extends State<PaginainicialComponenteWidget> {
  late PaginainicialComponenteModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PaginainicialComponenteModel());

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

    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            wrapWithModel(
              model: _model.widgetPaginaInicialFiltersModel,
              updateCallback: () => safeSetState(() {}),
              child: WidgetPaginaInicialFiltersWidget(),
            ),
          ],
        ),
        Align(
          alignment: AlignmentDirectional(0.0, 0.0),
          child: AuthUserStreamWidget(
            builder: (context) => StreamBuilder<List<TasksRecord>>(
              stream: FFAppState().querySwipes(
                requestFn: () => queryTasksRecord(
                  queryBuilder: (tasksRecord) => tasksRecord.where(
                    'Categoria',
                    isEqualTo: () {
                      if ((FFAppState().filtercategory != '') &&
                          (FFAppState().filtercategory != 'All')) {
                        return FFAppState().filtercategory;
                      } else if (FFAppState().filtercategory == 'All') {
                        return '';
                      } else {
                        return '';
                      }
                    }(),
                  ).whereNotIn(
                      'idDaTask',
                      (currentUserDocument?.iDdastasksAceitadas.toList() ??
                          [])),
                ),
              ),
              builder: (context, snapshot) {
                // Customize what your widget looks like when it's loading.
                if (!snapshot.hasData) {
                  return CiruclarphotowithborderWidget();
                }
                List<TasksRecord> containerTasksRecordList = snapshot.data!;

                return Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Stack(
                      children: [
                        Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 5.0, 0.0, 0.0),
                            child: Container(
                              width: double.infinity,
                              height: MediaQuery.sizeOf(context).height * 0.7,
                              child: custom_widgets.FlutterCardSwiper(
                                width: double.infinity,
                                height: MediaQuery.sizeOf(context).height * 0.7,
                                tasksList: containerTasksRecordList,
                                currentUser: currentUserReference!,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ].divide(SizedBox(height: 8.0)),
    );
  }
}
