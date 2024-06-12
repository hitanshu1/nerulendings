

import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';

/// firebase Storage functions
class FireBaseStorageService{

  /// firebase instance
  final FirebaseStorage firebaseStorage = FirebaseStorage.instance;

  /// upload image with file
  Future<String>uploadImageFile(XFile file,String path)async{
    try {
      /// Create a reference to the file location in Firebase Storage
      final Reference ref = FirebaseStorage.instance.ref().child('$path.jpg');

      /// Upload the file
      final UploadTask uploadTask = ref.putFile(File(file.path));

      /// Wait until the upload completes
       await uploadTask;
      await Future<void>.delayed(const Duration(milliseconds: 5));

      /// Get the download URL
      final String url = await ref.getDownloadURL();
      return url;
    } on FirebaseException catch (e) {
      if (kDebugMode) {
        print('FirebaseException: ${e.message}');
      }
      rethrow;  // Re-throw the exception after logging it
    } catch (e) {
      if (kDebugMode) {
        print('General Exception: $e');
      }
      rethrow;  // Re-throw the exception after logging it
    }
  }
  /// upload from file path
  Future<String?>uploadImageFromPath(String filePath,String path)async{
    try{

      await firebaseStorage.ref().child(path).putFile(
          File(filePath),
          SettableMetadata(contentType: 'image/jpeg'));
      final String url= await firebaseStorage
          .ref(path)
          .getDownloadURL();
      return url;
    }catch(e){
      print('error$e');
      return null;
    }

  }
  // ///get path from url
  // String getPathStorageFromUrl(String url){
  //
  //   const String baseUrl = "https://firebasestorage.googleapis.com/v0/b/nerulendingsoftware-7d3d1/o/";
  //
  //   String imagePath = url.replaceAll(baseUrl,"");
  //
  //   int indexOfEndPath = imagePath.indexOf("?");
  //
  //   imagePath = imagePath.substring(0,indexOfEndPath);
  //
  //   imagePath = imagePath.replaceAll("%2F","/");
  //
  //   return imagePath;
  // }
  //
  // /// delete from url
  // Future<bool>deleteImageFromUrl(String ?url)async{
  //   if(url!=null){
  //     try{
  //       String path=getPathStorageFromUrl(url);
  //       await firebaseStorage.ref().child(path).delete();
  //       return true;
  //     }catch(e){
  //       return false;
  //     }
  //
  //   }else{
  //     return false;
  //   }
  // }

}
