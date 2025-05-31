import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "edited_time" field.
  DateTime? _editedTime;
  DateTime? get editedTime => _editedTime;
  bool hasEditedTime() => _editedTime != null;

  // "bio" field.
  String? _bio;
  String get bio => _bio ?? '';
  bool hasBio() => _bio != null;

  // "user_name" field.
  String? _userName;
  String get userName => _userName ?? '';
  bool hasUserName() => _userName != null;

  // "credit_card" field.
  List<NewcartaodecreditoStruct>? _creditCard;
  List<NewcartaodecreditoStruct> get creditCard => _creditCard ?? const [];
  bool hasCreditCard() => _creditCard != null;

  // "stripeAccountID" field.
  String? _stripeAccountID;
  String get stripeAccountID => _stripeAccountID ?? '';
  bool hasStripeAccountID() => _stripeAccountID != null;

  // "stripeChargeEnable" field.
  bool? _stripeChargeEnable;
  bool get stripeChargeEnable => _stripeChargeEnable ?? false;
  bool hasStripeChargeEnable() => _stripeChargeEnable != null;

  // "hobbys" field.
  List<String>? _hobbys;
  List<String> get hobbys => _hobbys ?? const [];
  bool hasHobbys() => _hobbys != null;

  // "genero" field.
  String? _genero;
  String get genero => _genero ?? '';
  bool hasGenero() => _genero != null;

  // "facebook" field.
  String? _facebook;
  String get facebook => _facebook ?? '';
  bool hasFacebook() => _facebook != null;

  // "location" field.
  LatLng? _location;
  LatLng? get location => _location;
  bool hasLocation() => _location != null;

  // "iDdastasksAceitadas" field.
  List<String>? _iDdastasksAceitadas;
  List<String> get iDdastasksAceitadas => _iDdastasksAceitadas ?? const [];
  bool hasIDdastasksAceitadas() => _iDdastasksAceitadas != null;

  // "avaliacoes" field.
  List<AvaliacoesStruct>? _avaliacoes;
  List<AvaliacoesStruct> get avaliacoes => _avaliacoes ?? const [];
  bool hasAvaliacoes() => _avaliacoes != null;

  // "tasksRealizadas" field.
  List<String>? _tasksRealizadas;
  List<String> get tasksRealizadas => _tasksRealizadas ?? const [];
  bool hasTasksRealizadas() => _tasksRealizadas != null;

  // "quantTasksRealizadas" field.
  int? _quantTasksRealizadas;
  int get quantTasksRealizadas => _quantTasksRealizadas ?? 0;
  bool hasQuantTasksRealizadas() => _quantTasksRealizadas != null;

  // "taskOrTaskee" field.
  String? _taskOrTaskee;
  String get taskOrTaskee => _taskOrTaskee ?? '';
  bool hasTaskOrTaskee() => _taskOrTaskee != null;

  // "saldo" field.
  double? _saldo;
  double get saldo => _saldo ?? 0.0;
  bool hasSaldo() => _saldo != null;

  // "deposityTransacoes" field.
  List<DepositsTaskeeStruct>? _deposityTransacoes;
  List<DepositsTaskeeStruct> get deposityTransacoes =>
      _deposityTransacoes ?? const [];
  bool hasDeposityTransacoes() => _deposityTransacoes != null;

  // "clienteStripeId" field.
  String? _clienteStripeId;
  String get clienteStripeId => _clienteStripeId ?? '';
  bool hasClienteStripeId() => _clienteStripeId != null;

  // "dob" field.
  DateTime? _dob;
  DateTime? get dob => _dob;
  bool hasDob() => _dob != null;

  // "verifyaccount" field.
  bool? _verifyaccount;
  bool get verifyaccount => _verifyaccount ?? false;
  bool hasVerifyaccount() => _verifyaccount != null;

  // "requestFeitas" field.
  DocumentReference? _requestFeitas;
  DocumentReference? get requestFeitas => _requestFeitas;
  bool hasRequestFeitas() => _requestFeitas != null;

  // "rating" field.
  double? _rating;
  double get rating => _rating ?? 0.0;
  bool hasRating() => _rating != null;

  // "transferId" field.
  String? _transferId;
  String get transferId => _transferId ?? '';
  bool hasTransferId() => _transferId != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _editedTime = snapshotData['edited_time'] as DateTime?;
    _bio = snapshotData['bio'] as String?;
    _userName = snapshotData['user_name'] as String?;
    _creditCard = getStructList(
      snapshotData['credit_card'],
      NewcartaodecreditoStruct.fromMap,
    );
    _stripeAccountID = snapshotData['stripeAccountID'] as String?;
    _stripeChargeEnable = snapshotData['stripeChargeEnable'] as bool?;
    _hobbys = getDataList(snapshotData['hobbys']);
    _genero = snapshotData['genero'] as String?;
    _facebook = snapshotData['facebook'] as String?;
    _location = snapshotData['location'] as LatLng?;
    _iDdastasksAceitadas = getDataList(snapshotData['iDdastasksAceitadas']);
    _avaliacoes = getStructList(
      snapshotData['avaliacoes'],
      AvaliacoesStruct.fromMap,
    );
    _tasksRealizadas = getDataList(snapshotData['tasksRealizadas']);
    _quantTasksRealizadas =
        castToType<int>(snapshotData['quantTasksRealizadas']);
    _taskOrTaskee = snapshotData['taskOrTaskee'] as String?;
    _saldo = castToType<double>(snapshotData['saldo']);
    _deposityTransacoes = getStructList(
      snapshotData['deposityTransacoes'],
      DepositsTaskeeStruct.fromMap,
    );
    _clienteStripeId = snapshotData['clienteStripeId'] as String?;
    _dob = snapshotData['dob'] as DateTime?;
    _verifyaccount = snapshotData['verifyaccount'] as bool?;
    _requestFeitas = snapshotData['requestFeitas'] as DocumentReference?;
    _rating = castToType<double>(snapshotData['rating']);
    _transferId = snapshotData['transferId'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersRecordData({
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  DateTime? editedTime,
  String? bio,
  String? userName,
  String? stripeAccountID,
  bool? stripeChargeEnable,
  String? genero,
  String? facebook,
  LatLng? location,
  int? quantTasksRealizadas,
  String? taskOrTaskee,
  double? saldo,
  String? clienteStripeId,
  DateTime? dob,
  bool? verifyaccount,
  DocumentReference? requestFeitas,
  double? rating,
  String? transferId,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'display_name': displayName,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'edited_time': editedTime,
      'bio': bio,
      'user_name': userName,
      'stripeAccountID': stripeAccountID,
      'stripeChargeEnable': stripeChargeEnable,
      'genero': genero,
      'facebook': facebook,
      'location': location,
      'quantTasksRealizadas': quantTasksRealizadas,
      'taskOrTaskee': taskOrTaskee,
      'saldo': saldo,
      'clienteStripeId': clienteStripeId,
      'dob': dob,
      'verifyaccount': verifyaccount,
      'requestFeitas': requestFeitas,
      'rating': rating,
      'transferId': transferId,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    const listEquality = ListEquality();
    return e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.editedTime == e2?.editedTime &&
        e1?.bio == e2?.bio &&
        e1?.userName == e2?.userName &&
        listEquality.equals(e1?.creditCard, e2?.creditCard) &&
        e1?.stripeAccountID == e2?.stripeAccountID &&
        e1?.stripeChargeEnable == e2?.stripeChargeEnable &&
        listEquality.equals(e1?.hobbys, e2?.hobbys) &&
        e1?.genero == e2?.genero &&
        e1?.facebook == e2?.facebook &&
        e1?.location == e2?.location &&
        listEquality.equals(e1?.iDdastasksAceitadas, e2?.iDdastasksAceitadas) &&
        listEquality.equals(e1?.avaliacoes, e2?.avaliacoes) &&
        listEquality.equals(e1?.tasksRealizadas, e2?.tasksRealizadas) &&
        e1?.quantTasksRealizadas == e2?.quantTasksRealizadas &&
        e1?.taskOrTaskee == e2?.taskOrTaskee &&
        e1?.saldo == e2?.saldo &&
        listEquality.equals(e1?.deposityTransacoes, e2?.deposityTransacoes) &&
        e1?.clienteStripeId == e2?.clienteStripeId &&
        e1?.dob == e2?.dob &&
        e1?.verifyaccount == e2?.verifyaccount &&
        e1?.requestFeitas == e2?.requestFeitas &&
        e1?.rating == e2?.rating &&
        e1?.transferId == e2?.transferId;
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.email,
        e?.displayName,
        e?.photoUrl,
        e?.uid,
        e?.createdTime,
        e?.phoneNumber,
        e?.editedTime,
        e?.bio,
        e?.userName,
        e?.creditCard,
        e?.stripeAccountID,
        e?.stripeChargeEnable,
        e?.hobbys,
        e?.genero,
        e?.facebook,
        e?.location,
        e?.iDdastasksAceitadas,
        e?.avaliacoes,
        e?.tasksRealizadas,
        e?.quantTasksRealizadas,
        e?.taskOrTaskee,
        e?.saldo,
        e?.deposityTransacoes,
        e?.clienteStripeId,
        e?.dob,
        e?.verifyaccount,
        e?.requestFeitas,
        e?.rating,
        e?.transferId
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
