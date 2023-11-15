import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PincodeRecord extends FirestoreRecord {
  PincodeRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "area" field.
  String? _area;
  String get area => _area ?? '';
  bool hasArea() => _area != null;

  void _initializeFields() {
    _area = snapshotData['area'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('pincode');

  static Stream<PincodeRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PincodeRecord.fromSnapshot(s));

  static Future<PincodeRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PincodeRecord.fromSnapshot(s));

  static PincodeRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PincodeRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PincodeRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PincodeRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PincodeRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PincodeRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPincodeRecordData({
  String? area,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'area': area,
    }.withoutNulls,
  );

  return firestoreData;
}

class PincodeRecordDocumentEquality implements Equality<PincodeRecord> {
  const PincodeRecordDocumentEquality();

  @override
  bool equals(PincodeRecord? e1, PincodeRecord? e2) {
    return e1?.area == e2?.area;
  }

  @override
  int hash(PincodeRecord? e) => const ListEquality().hash([e?.area]);

  @override
  bool isValidKey(Object? o) => o is PincodeRecord;
}
