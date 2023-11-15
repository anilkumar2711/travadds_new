import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FrequencyRecord extends FirestoreRecord {
  FrequencyRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "times" field.
  String? _times;
  String get times => _times ?? '';
  bool hasTimes() => _times != null;

  void _initializeFields() {
    _times = snapshotData['times'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('frequency');

  static Stream<FrequencyRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => FrequencyRecord.fromSnapshot(s));

  static Future<FrequencyRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => FrequencyRecord.fromSnapshot(s));

  static FrequencyRecord fromSnapshot(DocumentSnapshot snapshot) =>
      FrequencyRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static FrequencyRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      FrequencyRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'FrequencyRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is FrequencyRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createFrequencyRecordData({
  String? times,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'times': times,
    }.withoutNulls,
  );

  return firestoreData;
}

class FrequencyRecordDocumentEquality implements Equality<FrequencyRecord> {
  const FrequencyRecordDocumentEquality();

  @override
  bool equals(FrequencyRecord? e1, FrequencyRecord? e2) {
    return e1?.times == e2?.times;
  }

  @override
  int hash(FrequencyRecord? e) => const ListEquality().hash([e?.times]);

  @override
  bool isValidKey(Object? o) => o is FrequencyRecord;
}
