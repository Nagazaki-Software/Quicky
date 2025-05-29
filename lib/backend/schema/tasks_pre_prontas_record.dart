import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TasksPreProntasRecord extends FirestoreRecord {
  TasksPreProntasRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "taskName" field.
  String? _taskName;
  String get taskName => _taskName ?? '';
  bool hasTaskName() => _taskName != null;

  // "descricaoDaTask" field.
  String? _descricaoDaTask;
  String get descricaoDaTask => _descricaoDaTask ?? '';
  bool hasDescricaoDaTask() => _descricaoDaTask != null;

  // "valor" field.
  double? _valor;
  double get valor => _valor ?? 0.0;
  bool hasValor() => _valor != null;

  // "especificacoes1" field.
  String? _especificacoes1;
  String get especificacoes1 => _especificacoes1 ?? '';
  bool hasEspecificacoes1() => _especificacoes1 != null;

  // "especificacoes2" field.
  String? _especificacoes2;
  String get especificacoes2 => _especificacoes2 ?? '';
  bool hasEspecificacoes2() => _especificacoes2 != null;

  // "especificacoes3" field.
  String? _especificacoes3;
  String get especificacoes3 => _especificacoes3 ?? '';
  bool hasEspecificacoes3() => _especificacoes3 != null;

  // "especificacoes4" field.
  String? _especificacoes4;
  String get especificacoes4 => _especificacoes4 ?? '';
  bool hasEspecificacoes4() => _especificacoes4 != null;

  // "categoria" field.
  String? _categoria;
  String get categoria => _categoria ?? '';
  bool hasCategoria() => _categoria != null;

  void _initializeFields() {
    _taskName = snapshotData['taskName'] as String?;
    _descricaoDaTask = snapshotData['descricaoDaTask'] as String?;
    _valor = castToType<double>(snapshotData['valor']);
    _especificacoes1 = snapshotData['especificacoes1'] as String?;
    _especificacoes2 = snapshotData['especificacoes2'] as String?;
    _especificacoes3 = snapshotData['especificacoes3'] as String?;
    _especificacoes4 = snapshotData['especificacoes4'] as String?;
    _categoria = snapshotData['categoria'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('tasksPreProntas');

  static Stream<TasksPreProntasRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TasksPreProntasRecord.fromSnapshot(s));

  static Future<TasksPreProntasRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TasksPreProntasRecord.fromSnapshot(s));

  static TasksPreProntasRecord fromSnapshot(DocumentSnapshot snapshot) =>
      TasksPreProntasRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TasksPreProntasRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TasksPreProntasRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TasksPreProntasRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TasksPreProntasRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTasksPreProntasRecordData({
  String? taskName,
  String? descricaoDaTask,
  double? valor,
  String? especificacoes1,
  String? especificacoes2,
  String? especificacoes3,
  String? especificacoes4,
  String? categoria,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'taskName': taskName,
      'descricaoDaTask': descricaoDaTask,
      'valor': valor,
      'especificacoes1': especificacoes1,
      'especificacoes2': especificacoes2,
      'especificacoes3': especificacoes3,
      'especificacoes4': especificacoes4,
      'categoria': categoria,
    }.withoutNulls,
  );

  return firestoreData;
}

class TasksPreProntasRecordDocumentEquality
    implements Equality<TasksPreProntasRecord> {
  const TasksPreProntasRecordDocumentEquality();

  @override
  bool equals(TasksPreProntasRecord? e1, TasksPreProntasRecord? e2) {
    return e1?.taskName == e2?.taskName &&
        e1?.descricaoDaTask == e2?.descricaoDaTask &&
        e1?.valor == e2?.valor &&
        e1?.especificacoes1 == e2?.especificacoes1 &&
        e1?.especificacoes2 == e2?.especificacoes2 &&
        e1?.especificacoes3 == e2?.especificacoes3 &&
        e1?.especificacoes4 == e2?.especificacoes4 &&
        e1?.categoria == e2?.categoria;
  }

  @override
  int hash(TasksPreProntasRecord? e) => const ListEquality().hash([
        e?.taskName,
        e?.descricaoDaTask,
        e?.valor,
        e?.especificacoes1,
        e?.especificacoes2,
        e?.especificacoes3,
        e?.especificacoes4,
        e?.categoria
      ]);

  @override
  bool isValidKey(Object? o) => o is TasksPreProntasRecord;
}
