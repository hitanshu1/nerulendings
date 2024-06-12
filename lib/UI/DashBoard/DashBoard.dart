import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Controllers/DashBoardController.dart';
import 'Home/Home.dart';

/// app dashBoard page
class DashBoardPage extends StatelessWidget {
  /// constructor
  const DashBoardPage({super.key});


  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashBoardController>(
      builder: (DashBoardController gxValues) {
        return Scaffold(
          body: _body(gxValues.currentIndex),
        );
      }
    );
  }

  Widget _body(int index){
    return const HomePage();
  }
}
