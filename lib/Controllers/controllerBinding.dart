
import 'package:get/get.dart';
import 'DashBoardController.dart';

import 'HomeController.dart';

/// all controller initialize here
class ControllersBinding{
  const ControllersBinding._();


  /// controllers initialize function
 static void initialize(){
    Get.lazyPut<DashBoardController>(
          () => DashBoardController(),
    );
    Get.lazyPut<HomeController>(
          () => HomeController(),
    );


  }
}
