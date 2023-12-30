import 'package:flutter/material.dart';
import 'package:snap_notes_app/utils/ColorUtils.dart';

class CustomBottomNavBar extends StatelessWidget {
   CustomBottomNavBar({super.key,required this.selectedIndex,required this.onTap});
  int selectedIndex;
    Function(int) onTap;

  @override
  Widget build(BuildContext context) {
    return  Container(decoration: BoxDecoration(
        borderRadius: BorderRadius.only(topRight: Radius.circular(15),
    topLeft: Radius.circular(15))),
      child: SingleChildScrollView(child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [

          for (int i = 0; i < 5; i++) ...[
            i != 2 ? CustomNavbarItems(index: i,selectedIndex: selectedIndex,onTap: onTap,) : CustomNavbarCenterItems(index: i,onTap: onTap,)
          ]
        ]),),);
  }
}

class CustomBottomBarItems {
  final IconData icon;
  final String label;


  CustomBottomBarItems({
    required this.icon,
    required this.label,
  });
}

class CustomNavbarItems extends StatelessWidget {
   CustomNavbarItems({super.key,required this.index,required this.selectedIndex,required this.onTap});
  int index;
  int selectedIndex;
   final Function(int) onTap;

   List navBarItems = ["assets/images/navBarIcons/home_selected.png",
    "assets/images/navBarIcons/bookmark_selected.png",
    "assets/images/navBarIcons/bookmark_selected.png",
    "assets/images/navBarIcons/folder_selected.png",
    "assets/images/navBarIcons/settings_selected.png"];

  @override
  Widget build(BuildContext context) {
    return  SafeArea(child: InkWell(onTap: (){
      onTap(index);
    },
      child: Material(child: Padding(
        padding: const EdgeInsets.only(left: 10,right: 10,top: 5,bottom: 10),
        child: Container(
            child:Column(
          children: [
            Container(child: Image.asset(navBarItems[index],height: 23,width: 23,color: index == selectedIndex ? ColorUtils.appLogoColor : Colors.grey,)),
          ],
        )),
      ),),
    ));
  }
}

class CustomNavbarCenterItems extends StatelessWidget {
   CustomNavbarCenterItems({super.key,required this.index,required this.onTap});
  int index;
   final Function(int) onTap;

  @override
  Widget build(BuildContext context) {
    return  SafeArea(child: InkWell(onTap: (){
      onTap(index);
    },
      child: Material(child: Padding(
        padding: const EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 10),
        child: Container(
            child:Column(
              children: [
                Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(50),
                  color: ColorUtils.appLogoColor,
                ),
                  child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Icon(Icons.add,size: 28,color: Colors.white,),
                ),),
              ],
            )),
      ),),
    ));
  }
}

