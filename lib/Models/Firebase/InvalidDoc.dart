// ignore_for_file: always_declare_return_types, type_annotate_public_apis, always_specify_types, public_member_api_docs, subtype_of_sealed_class
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../Constants/Constants.dart';

///Used when the [Doc] parameter is required for a firebase document
class InvalidDoc extends Doc {
  ///ID which is obtained when a new doc is added and copied with
  String? newID;

  @override
  bool get exists => newID != null;

  @override
  String get id => newID ?? 'invalid';
  @override
  operator [](Object field) {
    throw UnimplementedError();
  }

  @override
  Json? data() {
    return <String, dynamic>{};
  }

  @override
  Object? get(Object field) {
    return data();
  }

  @override
  SnapshotMetadata get metadata => throw UnimplementedError();

  @override
  DocumentReference<Json> get reference => throw UnimplementedError();
}
