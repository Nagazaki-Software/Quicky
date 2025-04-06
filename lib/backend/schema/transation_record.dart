import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TransationRecord extends FirestoreRecord {
  TransationRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "session_id" field.
  String? _sessionId;
  String get sessionId => _sessionId ?? '';
  bool hasSessionId() => _sessionId != null;

  // "amount" field.
  int? _amount;
  int get amount => _amount ?? 0;
  bool hasAmount() => _amount != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _sessionId = snapshotData['session_id'] as String?;
    _amount = castToType<int>(snapshotData['amount']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('transation')
          : FirebaseFirestore.instance.collectionGroup('transation');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('transation').doc(id);

  static Stream<TransationRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TransationRecord.fromSnapshot(s));

  static Future<TransationRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TransationRecord.fromSnapshot(s));

  static TransationRecord fromSnapshot(DocumentSnapshot snapshot) =>
      TransationRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TransationRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TransationRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TransationRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TransationRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTransationRecordData({
  String? sessionId,
  int? amount,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'session_id': sessionId,
      'amount': amount,
    }.withoutNulls,
  );

  return firestoreData;
}

class TransationRecordDocumentEquality implements Equality<TransationRecord> {
  const TransationRecordDocumentEquality();

  @override
  bool equals(TransationRecord? e1, TransationRecord? e2) {
    return e1?.sessionId == e2?.sessionId && e1?.amount == e2?.amount;
  }

  @override
  int hash(TransationRecord? e) =>
      const ListEquality().hash([e?.sessionId, e?.amount]);

  @override
  bool isValidKey(Object? o) => o is TransationRecord;
}
