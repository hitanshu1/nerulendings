part of './Extensions.dart';

// ignore: public_member_api_docs
extension DocExtension on Doc {
  ///Returns the [DocumentPath] for this Doc
  DocumentPath get docPath => DocumentPath.fromReference(reference);

  ///Returns Json from Doc
  Json get toJson => data() ?? <String, dynamic>{};

  ///Returns the createdAt value of the Document
  int get createdAt => toJson.createdAt;
}
