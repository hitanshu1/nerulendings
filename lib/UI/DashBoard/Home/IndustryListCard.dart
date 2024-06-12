import 'package:flutter/material.dart';

import '../../../Constants/Constants.dart';
import '../../../Models/Industry.dart';
import '../../../Widgets/ViewAppImage.dart';
import '../../../Widgets/Widgets.dart';

/// IndustryListCard show industry tile
class IndustryListCard extends StatelessWidget {
  /// industry data
  final Industry industry;
  /// constructor
  const IndustryListCard({super.key,required this.industry});

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.blue.shade800,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const <BoxShadow>[
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Stack(
        children:  <Widget>[
         ViewAppImage(
           radius: 20,
           imageUrl: industry.image,
           assetsUrl: Assets.logo,
         ),
          Positioned.fill(
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Container(
                  width:MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(.8),
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20)
                    )
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Wrap(
                      children: <Widget>[
                        Txt(industry.name,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,),
                         TxtButton(
                          text: 'Click To Enter',
                          onPressed: (){

                          },
                        )
                      ],
                    ),
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
