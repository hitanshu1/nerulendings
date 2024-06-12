import 'package:cloud_firestore/cloud_firestore.dart';

import '../Constants/Constants.dart';
import '../Models/Firebase/DocumentPath.dart';
import '../Models/Firebase/InvalidDoc.dart';
import '../Models/ModelDoc.dart';
import '../Widgets/Widgets.dart';

///Service class to communicate with Firestore
class FirestoreService {
  ///Private constructor to avoid duplicate instance
  FirestoreService._privateConstructor();

  ///Private declaration of the instance
  static final FirestoreService _instance = FirestoreService._privateConstructor();

  ///Public getter to get the private instance
  static FirestoreService get instance => _instance;

  ///Instance of the firestire which is going to handle all the operations
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  ///The collection to be queried either for streaming or getting as future
  static Queryy collection(String collectionID) => _firestore.collection(collectionID);

  static Ref _getReference(DocumentPath documentPath) {
    return _firestore.collection(documentPath.collection).doc(documentPath.id);
  }

  ///Returns the requested document based on the document path if available
  static Future<Doc> get(DocumentPath documentPath) async {
    Doc doc = InvalidDoc();
    try {
      assert(documentPath != DocumentPath.invalid, 'Invalid DocumentPath: $documentPath');
      doc = await _getReference(documentPath).get();
    } catch (exception) {
      Widgets.showToast('Error $exception');
    }
    return doc;
  }

  ///Parses the DocumentPath value from the given object automatically
  static DocumentPath _documentPathFromObject(Object object) {
    DocumentPath _path = const DocumentPath(collection: 'collection', id: 'document');
    if (object is DocumentPath) {
      _path = object;
    }
    if (object is ModelDoc) {
      // _path = object.doc.docPath;
      _path = DocumentPath(collection: object.doc.reference.path, id: object.doc.reference.id);
    }
    if (object is Doc) {
      // _path = object.docPath;
      _path = DocumentPath(collection: object.reference.path, id: object.reference.id);
    }
    if (object is List<String>) {
      if (object.length == 2) {
        _path = DocumentPath(collection: object.first, id: object.last);
      }
    }
    return _path;
  }

  ///Streams the [Project] based on the given [DocumentSnapshot] id
  static Stream<T> streamDoc<T>(Object object, T Function(Doc doc) fromDoc) async* {
    final DocumentPath _path = _documentPathFromObject(object);
    yield* _firestore.collection(_path.collection).doc(_path.id).snapshots().map(fromDoc);
  }

  ///To add a new document to the given collection
  static Future<String?> add(String collectionID, Json data) async {
    Ref? ref;
    try {
      ref = await _firestore.collection(collectionID).add(data);
    } catch (exception) {
      Widgets.showToast('Error adding document: $exception');
    }
    return ref?.id;
  }

  ///To create a new document in the given documentID instead of random one!
  ///Also it updates if any document already available in the same documentID
  static Future<bool> set({
    required DocumentPath documentPath,
    required Json data,
  }) async {
    bool created = false;
    try {
      await _getReference(documentPath).set(data, SetOptions(merge: true));
      created = true;
    } catch (exception) {
      Widgets.showToast('Error setting document: $exception');
    }
    return created;
  }

  ///To update the document which is located in the given documentPath along with the given data
  static Future<bool> update({required DocumentPath documentPath, required Json data}) async {
    bool updated = false;
    final Ref ref = _getReference(documentPath);
    try {
      await _firestore.runTransaction((Transaction transaction) async {
        try {
          transaction.update(ref, data);
          updated = true;
        } catch (exception) {
          updated = false;
          Widgets.showToast('Error updating document in transaction $exception');
        }
      });
    } catch (exception) {
      updated = false;
      Widgets.showToast('Error updating document $exception');
    }
    return updated;
  }

  ///To Delete a document safely by the given document path if available
  ///Any data type can be give which will be sorted out to find the documentPath at the end!
  static Future<bool> delete(Object object) async {
    try {
      await _getReference(_documentPathFromObject(object)).delete();
      return true;
    } catch (exception) {
      Widgets.showToast('Error deleting document: $exception');
    }
    return false;
  }

  ///Returns the list of models from the given query
  static Stream<List<T>> streamDocs<T>(Queryy queryy, T Function(Doc doc) fromDoc) async* {
    yield* queryy.snapshots().map((QuerySnapshott s) => _snapshotToModels<T>(s, fromDoc));
  }

  ///Returns the list of models from the given query
  static Future<List<T>> getDocs<T>(Queryy queryy, T Function(Doc doc) fromDoc) async {
    final QuerySnapshott snapshott = await queryy.get();
    return _snapshotToModels<T>(snapshott, fromDoc);
  }

  ///Returns the list of models from the given query snapshot
  static List<T> _snapshotToModels<T>(QuerySnapshott snapshott, T Function(Doc doc) fromDoc) {
    return List<T>.generate(snapshott.docs.length, (int index) => fromDoc(snapshott.docs[index]));
  }
}
