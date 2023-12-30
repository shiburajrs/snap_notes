import 'package:flutter/material.dart';

import '../../../utils/ColorUtils.dart';
import '../../../utils/FontUtils.dart';

class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {

  List cardColor = [ColorUtils.cardColor1,ColorUtils.cardColor2,ColorUtils.cardColor3,ColorUtils.cardColor4];

  @override
  Widget build(BuildContext context) {
    return  Scaffold(appBar:AppBar(automaticallyImplyLeading: false,
      backgroundColor: ColorUtils.appLogoColor.withOpacity(0.7),
      title: Center(
        child: CustomText(
          text: 'Categories',
          fontSize: 18.0,
          color: Colors.black,
          fontWeight: FontWeight.w700,
          textAlign: TextAlign.center,
        ),
      ),
    ),
      body: SingleChildScrollView(
      child: Padding(padding: EdgeInsets.only(top: 20,left: 10,right: 10),
        child: Column(children: [
          GridView.builder(
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // Number of columns
              crossAxisSpacing: 20, // Spacing between columns
              mainAxisSpacing: 20, // Spacing between rows
            ),
            itemCount: 4, // Number of items in the grid
            itemBuilder: (context, index) {
              return Stack(
                children:[ Container(
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),
                    gradient: LinearGradient(colors: [
                      cardColor[index].withOpacity(0.5),
                      cardColor[index]
                    ],
                        begin: Alignment.topRight,end: Alignment.bottomLeft),),
                  alignment: Alignment.center,
                  child: Column(mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CustomText(
                        text: 'Categories',
                        fontSize: 18.0,
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 6,),

                    ],
                  ),
                ),
                Positioned(child: Image.asset("assets/images/navBarIcons/bookmark_selected.png",height: 30,),left: 5,)
                
                ]
              );
            },
          )
        ],),
      ),
    ),);
  }
}
