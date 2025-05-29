import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ChatHistoryRecord extends FirestoreRecord {
  ChatHistoryRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "documentUser" field.
  DocumentReference? _documentUser;
  DocumentReference? get documentUser => _documentUser;
  bool hasDocumentUser() => _documentUser != null;

  // "msg" field.
  String? _msg;
  String get msg => _msg ?? '';
  bool hasMsg() => _msg != null;

  // "horario" field.
  DateTime? _horario;
  DateTime? get horario => _horario;
  bool hasHorario() => _horario != null;

  // "msgdosystema" field.
  bool? _msgdosystema;
  bool get msgdosystema => _msgdosystema ?? false;
  bool hasMsgdosystema() => _msgdosystema != null;

  // "audio" field.
  String? _audio;
  String get audio => _audio ?? '';
  bool hasAudio() => _audio != null;

  // "foto" field.
  String? _foto;
  String get foto => _foto ?? '';
  bool hasFoto() => _foto != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _documentUser = snapshotData['documentUser'] as DocumentReference?;
    _msg = snapshotData['msg'] as String?;
    _horario = snapshotData['horario'] as DateTime?;
    _msgdosystema = snapshotData['msgdosystema'] as bool?;
    _audio = snapshotData['audio'] as String?;
    _foto = snapshotData['foto'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('chatHistory')
          : FirebaseFirestore.instance.collectionGroup('chatHistory');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('chatHistory').doc(id);

  static Stream<ChatHistoryRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ChatHistoryRecord.fromSnapshot(s));

  static Future<ChatHistoryRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ChatHistoryRecord.fromSnapshot(s));

  static ChatHistoryRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ChatHistoryRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ChatHistoryRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ChatHistoryRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ChatHistoryRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ChatHistoryRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createChatHistoryRecordData({
  DocumentReference? documentUser,
  String? msg,
  DateTime? horario,
  bool? msgdosystema,
  String? audio,
  String? foto,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'documentUser': documentUser,
      'msg': msg,
      'horario': horario,
      'msgdosystema': msgdosystema,
      'audio': audio,
      'foto': foto,
    }.withoutNulls,
  );

  return firestoreData;
}

class ChatHistoryRecordDocumentEquality implements Equality<ChatHistoryRecord> {
  const ChatHistoryRecordDocumentEquality();

  @override
  bool equals(ChatHistoryRecord? e1, ChatHistoryRecord? e2) {
    return e1?.documentUser == e2?.documentUser &&
        e1?.msg == e2?.msg &&
        e1?.horario == e2?.horario &&
        e1?.msgdosystema == e2?.msgdosystema &&
        e1?.audio == e2?.audio &&
        e1?.foto == e2?.foto;
  }

  @override
  int hash(ChatHistoryRecord? e) => const ListEquality().hash([
        e?.documentUser,
        e?.msg,
        e?.horario,
        e?.msgdosystema,
        e?.audio,
        e?.foto
      ]);

  @override
  bool isValidKey(Object? o) => o is ChatHistoryRecord;
}
