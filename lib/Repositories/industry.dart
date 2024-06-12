import 'package:cloud_firestore/cloud_firestore.dart';
import '../Constants/Constants.dart';
import '../Extensions/Extensions.dart';
import '../Models/Firebase/DocumentPath.dart';
import '../Models/Industry.dart';
import '../Services/Firestore.dart';
import 'Firestore.dart';

///Repo to manage all the crud operations related to Industry
class IndustryRepo extends FirestoreRepo<Industry> {
  IndustryRepo._();
  static final IndustryRepo _instance = IndustryRepo._();

  ///Quick instance of the repository
  static IndustryRepo get instance => _instance;

  @override
  String get collectionID => CollectionIDs.industries;

  @override
  DocumentPath get path => DocumentPath.empty(collectionID);

  @override
  Future<String?> add(Industry model) async {
    final String? id = await FirestoreService.add(path.collection, model.toJson);
    return id;
  }

  @override
  Future<Industry> get(String id) async {
    final Doc doc = await FirestoreService.get(path.copyWith(id: id));
    return Industry.fromDoc(doc);
  }

  @override
  Future<bool> update(Industry model) async {
    final bool updated = await FirestoreService.update(
      documentPath: model.doc.docPath,
      data: model.toJson,
    );
    return updated;
  }




  @override
  Future<bool> delete(Industry model) async {
    final bool deleted = await FirestoreService.delete(model);
    return deleted;
  }

  ///Streams the [Project] based on the given [DocumentSnapshot] id
  Stream<Industry> streamByID(String id) async* {
    yield* FirestoreService.streamDoc(path.copyWith(id: id), Industry.fromDoc);
  }

  @override
  Future<List<Industry>> getList({
    ///Last Document to set offset
    Doc? lastDoc,
  }) async {
    Queryy query = FirestoreService.collection(path.collection)

        .orderBy('createdAt', descending: true)
        .limit(Firestore.queryLimit);


    if (lastDoc != null) {
      query = query.startAfterDocument(lastDoc);
    }
    return FirestoreService.getDocs(query, Industry.fromDoc);
  }
}
