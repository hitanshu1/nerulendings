part of './Constants.dart';

///[Json]
typedef Json = Map<String, dynamic>;
// /Alias for a Firestore document, containing data of type [Json].

typedef Doc = DocumentSnapshot<Json>;

/// Alias for a Firestore document reference, containing data of type [Json].
typedef Ref = DocumentReference<Json>;

/// Alias for a Firestore query, typically used for querying Firestore collections and containing data of type [Json].
typedef Queryy = Query<Json>;

/// Alias for a Firestore query snapshot, containing multiple documents of type [Json].
typedef QuerySnapshott = QuerySnapshot<Json>;

///Used to map query snapshot docs to models
typedef QDoc = QueryDocumentSnapshot<Json>;
