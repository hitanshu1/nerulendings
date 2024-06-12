import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Constants/Constants.dart';
import '../../../Constants/sizeConfig.dart';
import '../../../Controllers/HomeController.dart';
import '../../../Widgets/ViewAppImage.dart';
import '../../../Widgets/Views/Views.dart';
import '../../../Widgets/Widgets.dart';
import 'AddEdit.dart';
import 'IndustryListCard.dart';

///Primary Home Page
class HomePage extends StatelessWidget {
  ///Constructor
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (HomeController gxValues) {
        return BodyContainer(
          child: SafeArea(
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Button.addUpdate(
                        toEdit: false, completeFn: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (BuildContext context) => const AddEditIndustry()),
                      );

                    }, showErrorFn: (){}, isValid: true)
                  ],
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        ViewAppImage(
                          assetsUrl: Assets.logo,
                          height: 200,
                          width: 200,
                        ),

                        SizeConfig.verticalSpaceSmall(),
                        GriddViewBuilder(
                          isLoading: gxValues.isLoading,
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            crossAxisCount: 2,
                            itemCount: gxValues.industries.length,item: (int index){
                          return Inkk(
                            onTap: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (BuildContext context) => AddEditIndustry(
                                  old: gxValues.industries[index],
                                )),
                              );
                            },
                              child: IndustryListCard(industry: gxValues.industries[index],));
                        })
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      }
    );
  }




}
