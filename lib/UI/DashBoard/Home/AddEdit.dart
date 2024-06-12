
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../Constants/sizeConfig.dart';
import '../../../Controllers/HomeController.dart';
import '../../../Models/Firebase/InvalidDoc.dart';
import '../../../Models/Industry.dart';
import '../../../Repositories/industry.dart';
import '../../../Services/FilePicker.dart';
import '../../../Services/FirebaseStorageService.dart';
import '../../../Widgets/ViewAppImage.dart';
import '../../../Widgets/Views/Views.dart';
import '../../../Widgets/Widgets.dart';

/// add/Edit industry details
class AddEditIndustry extends StatefulWidget {
  /// selected industry details
  final Industry? old;
  /// constructor
  const AddEditIndustry({super.key,this.old,});

  @override
  State<AddEditIndustry> createState() => _AddEditIndustryState();
}

class _AddEditIndustryState extends State<AddEditIndustry> {
  /// homeController for controller page state
  late HomeController  pageController=Get.put(HomeController());

  /// check if page for edit or add
  bool get toEdit=>widget.old!=null;

  String? name;

  XFile ?imageFile;
  late Industry industry;
  @override
  void initState() {
    if (widget.old != null) {
      industry = widget.old!;
      name=widget.old?.name;
      industry = industry.copyWith(
        createdAt: DateTime.now().millisecondsSinceEpoch,
      );
    } else {
      industry = widget.old ??
          Industry.invalid.copyWith(
            createdAt: DateTime.now().millisecondsSinceEpoch,
          );

    }
    setState(() {

    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text(toEdit?'Edit Industry':'Add Industry',),
      ),
      body: BodyContainer(
        child: ListView(
          children: <Widget>[

            ViewAppImage(
              height: 200,
              imageFile: imageFile,
              imageUrl: widget.old?.image,
            ),
            TxtButton(
              text: 'Upload',
              onPressed: ()async{
                final XFile? file=await FilePickerService().pickImage();
                if(file!=null){
                  imageFile=file;
                }
                setState(() {

                });
              },
            ),


            TxtField(text: name, hintText: 'Industry Name', onChanged: (String val){
              setState(() {
                name=val;
              });
            }),
            SizeConfig.verticalSpaceSmall(),
            Button.addUpdate(toEdit: toEdit,
                completeFn: addEdit,

                showErrorFn: (){
              Widgets.showToast('Please enter name');

                }, isValid: name!=null)
          ],
        ),
      ),
    );
  }

  Future<void> addEdit()async{
    print('www====1');
    industry = industry.copyWith(name: name);
    bool completed = false;
    print('www====2');
    if(imageFile!=null){
      final String url=await FireBaseStorageService().uploadImageFile(imageFile!, '/industries/${DateTime.now().toIso8601String()}');
      industry=industry.copyWith(image: url);
    }
    if (toEdit) {

      completed = await IndustryRepo.instance.update(industry);
    } else {
      final String? id = await IndustryRepo.instance.add(industry);
      completed = id != null;
      if (completed) {

        industry = industry.copyWith(doc: InvalidDoc()..newID = id);
      }
    }
    if (completed) {

      pageController.get();
      Navigator.pop(context);
      Widgets.showToast('${toEdit?'Edit':'Add'} Successfully');
    }
  }
}
