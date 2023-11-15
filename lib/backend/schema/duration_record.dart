import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DurationRecord extends FirestoreRecord {
  DurationRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "duration" field.
  String? _duration;
  String get duration => _duration ?? '';
  bool hasDuration() => _duration != null;

  void _initializeFields() {
    _duration = snapshotData['duration'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('duration');

  static Stream<DurationRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => DurationRecord.fromSnapshot(s));

  static Future<DurationRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => DurationRecord.fromSnapshot(s));

  static DurationRecord fromSnapshot(DocumentSnapshot snapshot) =>
      DurationRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static DurationRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      DurationRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'DurationRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is DurationRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createDurationRecordData({
  String? duration,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'duration': duration,
    }.withoutNulls,
  );

  return firestoreData;
}

class DurationRecordDocumentEquality implements Equality<DurationRecord> {
  const DurationRecordDocumentEquality();

  @override
  bool equals(DurationRecord? e1, DurationRecord? e2) {
    return e1?.duration == e2?.duration;
  }

  @override
  int hash(DurationRecord? e) => const ListEquality().hash([e?.duration]);

  @override
  bool isValidKey(Object? o) => o is DurationRecord;
}
