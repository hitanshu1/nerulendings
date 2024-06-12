
import 'package:get/get_state_manager/get_state_manager.dart';

import '../Models/Industry.dart';
import '../Repositories/industry.dart';

/// homeController control state of home 
class HomeController extends GetxController{
  
  /// check is the page in loading state
  bool isLoading=false;
  
  /// all list of industries
  List<Industry>industries=<Industry>[];
  

  @override
  void onInit() {
   get();
    super.onInit();
  }

  /// get industries list
  Future<void> get()async{
    isLoading=true;
    update();
    industries=await IndustryRepo.instance.getList();
    isLoading=false;
    update();
  }

  /// add update
  void addUpdate(Industry industry){

  }
}
