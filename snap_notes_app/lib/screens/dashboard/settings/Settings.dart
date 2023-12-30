import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:snap_notes_app/utils/ColorUtils.dart';
import 'package:snap_notes_app/utils/DataUtils.dart';

import '../../../themes/ThemeNotifier.dart';
import '../../../utils/FontUtils.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {


    Widget generalOptions(){
      return ListView.builder(shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: DataUtils.generalOptions().length,
          itemBuilder: (context,index){
        return Container(margin: EdgeInsets.only(bottom: 15),
          child: Column(mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(onTap: (){
                clickGeneralOptionFunction(index);
              },
                child: Row(mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.person,color: ColorUtils.appLogoColor,),
                  SizedBox(width: 22,),
                  CustomText(
                    text: DataUtils.generalOptions()[index].title,
                    fontSize: 13.0,
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    textAlign: TextAlign.start,
                  ),

                  Spacer(),

                  Icon(Icons.arrow_forward_ios_outlined,size: 18,color: ColorUtils.appLogoColor.withOpacity(0.5),)
                ],),
              ),

              SizedBox(height: 10,),

              Divider(height: 1,color: Colors.grey.withOpacity(0.3),)
            ],
          ),
        );
      });
    }

    Widget feedbackOptions(){
      return ListView.builder(shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: DataUtils.feedbackOptions().length,
          itemBuilder: (context,index){
            return Container(margin: EdgeInsets.only(bottom: 15),
              child: Column(mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(Icons.person,color: ColorUtils.appLogoColor),
                      SizedBox(width: 22,),
                      CustomText(
                        text: DataUtils.feedbackOptions()[index].title,
                        fontSize: 13.0,
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                        textAlign: TextAlign.start,
                      ),

                      Spacer(),

                      Icon(Icons.arrow_forward_ios_outlined,size: 18,color: ColorUtils.appLogoColor.withOpacity(0.5),)
                    ],),

                  SizedBox(height: 10,),

                  Divider(height: 1,color: Colors.grey.withOpacity(0.3),)
                ],
              ),
            );
          });
    }

    return  Scaffold( appBar: AppBar(automaticallyImplyLeading: false,
      backgroundColor: ColorUtils.appLogoColor.withOpacity(0.7),
      title: Center(
        child: CustomText(
          text: 'Settings',
          fontSize: 18.0,
          color: Colors.black,
          fontWeight: FontWeight.w700,
          textAlign: TextAlign.center,
        ),
      ),
    ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20,left: 20,right: 20),
        child: Column(mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

        CustomText(
          text: 'General',
          fontSize: 17.0,
          color: Colors.grey,
          fontWeight: FontWeight.w700,
          textAlign: TextAlign.center,
        ),

              SizedBox(height: 25,),

              generalOptions(),


              SizedBox(height: 20,),


              CustomText(
                text: 'Feedback',
                fontSize: 17.0,
                color: Colors.grey,
                fontWeight: FontWeight.w700,
                textAlign: TextAlign.center,
              ),

              SizedBox(height: 25,),

              feedbackOptions()

            ],),
      ),);
  }

  void _settingModalBottomSheet(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return Container(height: 200,
            decoration: const BoxDecoration(

                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25))),
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.only(top: 30, left: 15, right: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(child: CustomText(
                    text: 'Theme',
                    fontSize: 17.0,
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    textAlign: TextAlign.center,
                  ),),
                  
                  SizedBox(height: 15,),

                  InkWell(onTap: (){
                    Provider.of<ThemeNotifier>(context, listen: false).toggleTheme();
                  },
                    child: Row(
                      children: [
                        CustomText(
                          text: 'Dark Theme',
                          fontSize: 14.0,
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          textAlign: TextAlign.center,
                        ),

                        Spacer(),


                        Icon(Icons.check_circle,color: ColorUtils.appLogoColor,)
                      ],
                    ),
                  ),
                  
                  SizedBox(height: 10,),
                  
                  Divider(height: 1,color: Colors.grey.withOpacity(0.5),),

                  SizedBox(height: 20,),

                  InkWell(onTap: (){
                    Provider.of<ThemeNotifier>(context, listen: false).toggleTheme();
                  },
                    child: Row(
                      children: [
                        CustomText(
                          text: 'Light Theme',
                          fontSize: 14.0,
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          textAlign: TextAlign.center,
                        ),

                        Spacer(),


                        Icon(Icons.check_circle,color: ColorUtils.appLogoColor,)
                      ],
                    ),
                  ),
                 
                ],
              ),
            ),
          );
        });
  }

  void clickGeneralOptionFunction(int index){
    switch(index){
      case 0: {
        _settingModalBottomSheet(context);
      } break;

      case 1: {

      } break;
    }

  }
}
