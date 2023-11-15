import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AmountRecord extends FirestoreRecord {
  AmountRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "rupees" field.
  String? _rupees;
  String get rupees => _rupees ?? '';
  bool hasRupees() => _rupees != null;

  void _initializeFields() {
    _rupees = snapshotData['rupees'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('amount');

  static Stream<AmountRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AmountRecord.fromSnapshot(s));

  static Future<AmountRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AmountRecord.fromSnapshot(s));

  static AmountRecord fromSnapshot(DocumentSnapshot snapshot) => AmountRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AmountRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AmountRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AmountRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AmountRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAmountRecordData({
  String? rupees,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'rupees': rupees,
    }.withoutNulls,
  );

  return firestoreData;
}

class AmountRecordDocumentEquality implements Equality<AmountRecord> {
  const AmountRecordDocumentEquality();

  @override
  bool equals(AmountRecord? e1, AmountRecord? e2) {
    return e1?.rupees == e2?.rupees;
  }

  @override
  int hash(AmountRecord? e) => const ListEquality().hash([e?.rupees]);

  @override
  bool isValidKey(Object? o) => o is AmountRecord;
}
