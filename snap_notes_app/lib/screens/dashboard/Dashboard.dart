import 'package:flutter/material.dart';
import 'package:snap_notes_app/main.dart';
import 'package:snap_notes_app/screens/dashboard/addNotes/AddNotes.dart';
import 'package:snap_notes_app/screens/dashboard/homepage/Homepage.dart';
import 'package:snap_notes_app/screens/dashboard/savedNotes/SavedNotes.dart';
import 'package:snap_notes_app/screens/dashboard/settings/Settings.dart';

import '../../widgets/customBottomNavbar/CustomBottomNavBar.dart';
import 'categories/Categories.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

  PageController _pageController = PageController();
  int _currentIndex = 0;
  List screens = [Homepage(),SavedNotes(),AddNotes(),Categories(),Settings()];

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body: Column(
          children: [

            Expanded(
              child: PageView.builder(
                  controller: _pageController,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 5,
                  onPageChanged: (int page) {
                    setState(() {
                      _currentIndex = page;
                    });
                  },
                  itemBuilder: (BuildContext context, int index){
                    return screens[index];
                  }
              ),
            ),

            CustomBottomNavBar(selectedIndex: _currentIndex,onTap: (index){
             _pageController.jumpToPage(index);
            },)
      ],
        ));
  }
}
