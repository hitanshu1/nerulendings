import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

import '../../Constants/Constants.dart';

///An unique data model which can handle any type of [Firebase] document paths
///to increase the productivity

class DocumentPath extends Equatable {

  ///Constructor
  const DocumentPath({required this.collection, required this.id});
  ///Returns an empty invalid documentPath which can be later used with copyWith function
  factory DocumentPath.empty(String collectionID) => DocumentPath(collection: collectionID, id: '');
  ///Creates a DocumentPath from [Json] map
  factory DocumentPath.fromPath(String _documentPath) {
    final List<String> list = _documentPath.split('/');
    if (list.length == 2) {
      ///We don't use [SubCollections], so that the length of the [_list] must be [2] always
      final String collection = list[0];
      final String id = list[1];
      return DocumentPath(collection: collection, id: id);
    } else {
      return invalid;
    }
  }

  ///Creates a DocumentPath from [DocumentReference]
  factory DocumentPath.fromReference(DocumentReference<dynamic> _reference) {
    return DocumentPath.fromPath(_reference.path);
  }
  ///[CollectionID] of the firebase document
  final String collection;

  ///[DocumentID] of the firebase document
  final String id;

  ///Gives the string [path] of given [DocumentPath]
  String get toDocumentPath => '$collection/$id';

  ///Creates the [Joson] representation of the current [DocumentPath]
  Map<String, dynamic> get toJson => <String, dynamic>{
    'collection': collection,
    'id': id,
  };

  ///Default [Invalid] value to handle errors
  static DocumentPath invalid = const DocumentPath(collection: 'errors', id: '404');


  ///Path of Remote configuration document for [android]
  static DocumentPath androidRemoteConfiguration = const DocumentPath(
    collection: CollectionIDs.remoteConfigurations, id: 'android',);



  ///Path of Remote configuration document for [ios]
  static DocumentPath iosRemoteConfiguration = const DocumentPath(
    collection: CollectionIDs.remoteConfigurations, id: 'ios',);

  @override
  List<dynamic> get props => <dynamic>[collection, id];

  @override
  String toString() {
    return toJson.toString();
  }

  ///Creates new instance of the path
  DocumentPath copyWith({String? collection, String? id}) {
    return DocumentPath(
      collection: collection ?? this.collection,
      id: id ?? this.id,
    );
  }
}
