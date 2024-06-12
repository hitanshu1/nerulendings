import '../Models/Firebase/DocumentPath.dart';
import '../Models/Model.dart';

/// Base repo to maintain all the standard operations required for a repository
// ignore_for_file: avoid_types_as_parameter_names

abstract class CrudRepo<T extends Model> {
  /// To add a document
  Future<String?> add(T model);

  /// To update the given document
  Future<bool> update(T model);

  /// To delete a document
  Future<bool> delete(T model);

  /// Returns the data from the documentID
  Future<T> get(String id);

  /// Returns the list of models from the given query
  Future<List<T>> getList();
}

///Dedicated Firestore repostitory
abstract class FirestoreRepo<T extends Model> implements CrudRepo<T> {
  /// Primary collection to be managed in this repository
  String get collectionID;

  /// Primary path which can be used with [copyWith]
  DocumentPath get path;

  @override
  Future<T> get(String id);

  @override
  Future<String?> add(T model);

  @override
  Future<bool> update(T model);

  @override
  Future<bool> delete(T model);

  @override
  Future<List<T>> getList();
}
