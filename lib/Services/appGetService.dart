
import 'package:get/get.dart';

/// AppGetService to Controll navigation
class AppGetService{
  AppGetService._privateConstructor();

  /// navigate to next page
  static void navigateTo(String routeName,{Object? argument,Function? then}){
    Get.toNamed(routeName,arguments: argument)?.then((dynamic value){
      if(then!=null) {
        then(value);
      }
    });
  }
  /// navigate to replace page
  static void navigateAndOff(String routeName,{Object? argument}){
    Get.offAndToNamed(routeName,arguments: argument);
  }
  /// navigate to replace all page
  static void navigateOffAll(String routeName,{Object? argument}){
    Get.offAllNamed(routeName,arguments: argument);
  }

  ///  navigate back to previous page
  static void back(){
    Get.back();
  }
}
