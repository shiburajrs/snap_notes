import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:snap_notes_app/screens/dashboard/addNotes/AddNotes.dart';
import 'package:snap_notes_app/services/databaseManager/NotesDatabaseManager.dart';
import 'package:snap_notes_app/utils/ColorUtils.dart';
import 'package:snap_notes_app/utils/DateTimeConversioins.dart';

import '../../../models/Notes.dart';
import '../../../utils/FontUtils.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage>  with WidgetsBindingObserver {

  List cardColor = [ColorUtils.cardColor1,ColorUtils.cardColor2,ColorUtils.cardColor3,ColorUtils.cardColor4];
  NotesDatabaseManager notesDatabaseManager = NotesDatabaseManager();
  List<Note> allNotes = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    notesDatabaseManager.initializeDatabase();
    getAllNotes();

  }


  @override
  void dispose() {
    WidgetsBinding.instance!.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);

    if (state == AppLifecycleState.resumed) {
      notesDatabaseManager.initializeDatabase();
      getAllNotes();
    }
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
              itemCount: allNotes.length,
              shrinkWrap: true,
              itemBuilder: (context,index){
            return InkWell(onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) =>  AddNotes(addedNote: allNotes[index],)),);
            },
              child: Container(margin: EdgeInsets.only(bottom: 20),width: double.infinity,decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),
                  gradient: LinearGradient(colors: [
                    Color(int.parse(allNotes[index].color??"")).withOpacity(0.5),
                Color(int.parse(allNotes[index].color??""))
                  ],
                  begin: Alignment.topRight,end: Alignment.bottomLeft),),
              child: Padding(
                padding: const EdgeInsets.all(11),
                child: Column(mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CustomText(
                        text: allNotes[index].title,
                        fontSize: 17.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        textAlign: TextAlign.center,
                      ),

                      Spacer(),

                      CustomText(
                        text: DateTimeConversions.extractDate(allNotes[index].createdAt),
                        fontSize: 13.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),

                  SizedBox(height: 8,),

                  CustomText(
                    text: allNotes[index].content,
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
                        allNotes[index].category,
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
              ),),
            );
          })
        
        ],),),
      )
    );
  }

  void getAllNotes()async {
    List<Note> notes = await notesDatabaseManager.getAllNotes();
    setState(() {
      allNotes = notes;
    });

  }

}
