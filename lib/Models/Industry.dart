
import '../Constants/Constants.dart';
import '../Extensions/Extensions.dart';
import 'Firebase/InvalidDoc.dart';
import 'ModelDoc.dart';

/// A Industry model containing details about the Industry
class Industry extends ModelDoc {
  /// Name of the Industry
  final String name;

  /// Image of the Industry
  final String image;


  /// Constructor
  Industry({
    required super.createdAt,
    required super.doc,
    required this.name,
    required this.image,
  });

  /// Creates a [Userr] from the given [Json]
  factory Industry.fromDoc(Doc doc) {
    if (doc.exists == false) {
      return invalid;
    }
    final Json json = doc.toJson;
    return Industry(
      createdAt: json.createdAt,
      doc: doc,
      name: json.safeString('name'),
      image: json['image'],
    );
  }

  @override
  Json get toJson => <String, dynamic>{
    'createdAt': createdAt,
    'name': name,
    'image': image,
  };

  @override
  Industry copyWith({
    int? createdAt,
    Doc? doc,
    String? image,
    String? name,
  }) {
    return Industry(
      createdAt: createdAt ?? this.createdAt,
      doc: doc ?? this.doc,
      image: image ?? this.image,
      name: name ?? this.name,
    );
  }

  ///@placeholder
  static Industry invalid = Industry(
    createdAt: 0,
    doc: InvalidDoc(),
    image: '',
    name: '',
  );
}
