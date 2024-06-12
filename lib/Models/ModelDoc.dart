import '../Constants/Constants.dart';
import 'Model.dart';

///Class to define a proper model which is to be created from firestore document
abstract class ModelDoc extends Model {
  ///Time of creation in millisecondseapoch
  final int createdAt;

  ///Firebase document
  final Doc doc;
  

  ///Constructor
  ModelDoc({
    required this.createdAt,
    required this.doc,
  });
}
