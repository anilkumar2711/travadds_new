import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserRecord extends FirestoreRecord {
  UserRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "Days" field.
  int? _days;
  int get days => _days ?? 0;
  bool hasDays() => _days != null;

  // "Pincode" field.
  int? _pincode;
  int get pincode => _pincode ?? 0;
  bool hasPincode() => _pincode != null;

  // "screen" field.
  int? _screen;
  int get screen => _screen ?? 0;
  bool hasScreen() => _screen != null;

  // "minutes" field.
  double? _minutes;
  double get minutes => _minutes ?? 0.0;
  bool hasMinutes() => _minutes != null;

  // "baseCost" field.
  double? _baseCost;
  double get baseCost => _baseCost ?? 0.0;
  bool hasBaseCost() => _baseCost != null;

  // "total" field.
  double? _total;
  double get total => _total ?? 0.0;
  bool hasTotal() => _total != null;

  // "video" field.
  String? _video;
  String get video => _video ?? '';
  bool hasVideo() => _video != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "startDate" field.
  DateTime? _startDate;
  DateTime? get startDate => _startDate;
  bool hasStartDate() => _startDate != null;

  // "endDate" field.
  DateTime? _endDate;
  DateTime? get endDate => _endDate;
  bool hasEndDate() => _endDate != null;

  // "frequency" field.
  int? _frequency;
  int get frequency => _frequency ?? 0;
  bool hasFrequency() => _frequency != null;

  void _initializeFields() {
    _days = castToType<int>(snapshotData['Days']);
    _pincode = castToType<int>(snapshotData['Pincode']);
    _screen = castToType<int>(snapshotData['screen']);
    _minutes = castToType<double>(snapshotData['minutes']);
    _baseCost = castToType<double>(snapshotData['baseCost']);
    _total = castToType<double>(snapshotData['total']);
    _video = snapshotData['video'] as String?;
    _image = snapshotData['image'] as String?;
    _startDate = snapshotData['startDate'] as DateTime?;
    _endDate = snapshotData['endDate'] as DateTime?;
    _frequency = castToType<int>(snapshotData['frequency']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('user');

  static Stream<UserRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UserRecord.fromSnapshot(s));

  static Future<UserRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UserRecord.fromSnapshot(s));

  static UserRecord fromSnapshot(DocumentSnapshot snapshot) => UserRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UserRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UserRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UserRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UserRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUserRecordData({
  int? days,
  int? pincode,
  int? screen,
  double? minutes,
  double? baseCost,
  double? total,
  String? video,
  String? image,
  DateTime? startDate,
  DateTime? endDate,
  int? frequency,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Days': days,
      'Pincode': pincode,
      'screen': screen,
      'minutes': minutes,
      'baseCost': baseCost,
      'total': total,
      'video': video,
      'image': image,
      'startDate': startDate,
      'endDate': endDate,
      'frequency': frequency,
    }.withoutNulls,
  );

  return firestoreData;
}

class UserRecordDocumentEquality implements Equality<UserRecord> {
  const UserRecordDocumentEquality();

  @override
  bool equals(UserRecord? e1, UserRecord? e2) {
    return e1?.days == e2?.days &&
        e1?.pincode == e2?.pincode &&
        e1?.screen == e2?.screen &&
        e1?.minutes == e2?.minutes &&
        e1?.baseCost == e2?.baseCost &&
        e1?.total == e2?.total &&
        e1?.video == e2?.video &&
        e1?.image == e2?.image &&
        e1?.startDate == e2?.startDate &&
        e1?.endDate == e2?.endDate &&
        e1?.frequency == e2?.frequency;
  }

  @override
  int hash(UserRecord? e) => const ListEquality().hash([
        e?.days,
        e?.pincode,
        e?.screen,
        e?.minutes,
        e?.baseCost,
        e?.total,
        e?.video,
        e?.image,
        e?.startDate,
        e?.endDate,
        e?.frequency
      ]);

  @override
  bool isValidKey(Object? o) => o is UserRecord;
}
