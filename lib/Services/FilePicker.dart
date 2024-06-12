

import 'package:image_picker/image_picker.dart';

/// class us to pick images and files
class FilePickerService{

  final ImagePicker _picker = ImagePicker();
  /// pick image
  Future<XFile?>pickImage({ImageSource? source,double?maxWidth,double? maxHeight,int ?quality})async{
    final XFile? pickedFile = await _picker.pickImage(
      source: source??ImageSource.gallery,
      maxWidth: maxWidth,
      maxHeight: maxHeight,
      imageQuality: quality,
    );
    return pickedFile;
  }

}
