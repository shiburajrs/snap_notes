import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:snap_notes_app/utils/ColorUtils.dart';

import '../../../utils/FontUtils.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  List cardColor = [ColorUtils.cardColor1,ColorUtils.cardColor2,ColorUtils.cardColor3,ColorUtils.cardColor4];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: 45,
          backgroundColor: ColorUtils.appLogoColor.withOpacity(0.7),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomText(
                text: 'Snap Notes',
                fontSize: 18.0,
                color: Colors.black,
                fontWeight: FontWeight.bold,
                textAlign: TextAlign.center,
              ),
              Spacer(),
              Image.asset(
                "assets/images/app_logo.png",
                height: 25,
              ),
            ],
          )),

      body: SingleChildScrollView(
        child: Padding(padding: EdgeInsets.only(top: 40,left: 10,right: 10),child: Column(mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        
          ListView.builder(physics: ScrollPhysics(),
              itemCount: 4,
              shrinkWrap: true,
              itemBuilder: (context,index){
            return Container(margin: EdgeInsets.only(bottom: 20),width: double.infinity,decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),
                gradient: LinearGradient(colors: [
                  cardColor[index].withOpacity(0.5),
                  cardColor[index]
                ],
                begin: Alignment.topRight,end: Alignment.bottomLeft),),
            child: Padding(
              padding: const EdgeInsets.all(11),
              child: Column(mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CustomText(
                      text: 'Sample title',
                      fontSize: 17.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      textAlign: TextAlign.center,
                    ),

                    Spacer(),

                    CustomText(
                      text: '28-12-2023',
                      fontSize: 13.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),

                SizedBox(height: 8,),

                CustomText(
                  text: 'Lorem ipsum dolor sit amet, consectetur adipiscing  magna aliqua. Ut enim ad minim veniam.....',
                  fontSize: 14.0,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  textAlign: TextAlign.start,
                ),

                SizedBox(height: 20,),
                
                Container(height: 28,width: 80,

                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),
                  color: Colors.black),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Row(mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                    Icon(Icons.label,size: 18,color: Colors.white,),
                    SizedBox(width: 6,),
                    Text(
                      "Office",
                      style: TextStyle(
                        height: 1.5,
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    )

                                    ],),
                  ),)

                
              ],),
            ),);
          })
        
        ],),),
      )
    );
  }

}
