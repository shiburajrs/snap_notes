import 'package:flutter/material.dart';

import '../../../models/Notes.dart';
import '../../../services/databaseManager/NotesDatabaseManager.dart';
import '../../../utils/ColorUtils.dart';
import '../../../utils/CustomData.dart';
import '../../../utils/FontUtils.dart';

class AddNotes extends StatefulWidget {
   AddNotes({super.key, this.addedNote});
  Note? addedNote;

  @override
  State<AddNotes> createState() => _AddNotesState();
}

class _AddNotesState extends State<AddNotes>{

  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();
  bool _isBold = false;
  NotesDatabaseManager notesDatabaseManager = NotesDatabaseManager();
  String? selectedColor = null;
  int? selectedColorIndex = null;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    notesDatabaseManager.initializeDatabase();
    previousNote(widget.addedNote);
  }



  @override
  Widget build(BuildContext context) {

    
    Widget noteEditBar(){
      return Container(color: Colors.grey.withOpacity(0.3),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

          InkWell(child: Icon(Icons.format_bold,size: 20,),onTap: (){
            _toggleBold();
          },),
          Icon(Icons.format_align_center,size: 20,),
          Icon(Icons.format_align_justify,size: 20,),
          Icon(Icons.format_align_right,size: 20,),
          Icon(Icons.format_color_text_sharp,size: 20,),
          Icon(Icons.format_size,size: 20,)

                ],),
        ),);
    }


    Widget titleField(){
      return Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(8)),
        child:  Padding(
          padding: EdgeInsets.only(left: 20, right: 20),
          child: TextField(
            controller: titleController,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
            decoration: const InputDecoration(border: InputBorder.none,
                hintText: "Enter the title"),
            keyboardType: TextInputType.text,
            maxLines: 1,
          ),
        ),
      );
    }

    Widget contentField(){
      return     Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(10)),
        child:  Padding(
          padding: EdgeInsets.only(left: 20, right: 20),
          child: TextField(
            controller: contentController,
            style: TextStyle(
              fontFamily: 'Roboto',
              fontSize: 15,
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ),
            decoration: InputDecoration(
              hintText: "Write here...",
              border: InputBorder.none,
            ),
            keyboardType: TextInputType.text,
            maxLines: 15,
          ),
        ),
      );
    }

    Widget saveButton(){
      return Center(
        child: GestureDetector(onTap: (){
          saveNote();
        },
          child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),
            color: ColorUtils.appLogoColor,),
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: CustomText(
                text: 'Save Note',
                fontSize: 15.0,
                color: Colors.white,
                fontWeight: FontWeight.w700,
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      );
    }


    Widget modalSheetOptions() {
      return ListView.builder(
          shrinkWrap: true,
          itemCount: CustomData.notesOptionsData.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // CustomWidgets.noteOptionsIcon(
                  //     CustomData.notesOptionsData[index].image),
                  const SizedBox(
                    width: 20,
                  ),
                  CustomText(
                    text: CustomData.notesOptionsData[index].title,
                    fontSize: 15.0,
                    fontWeight: FontWeight.w300,
                    color: Colors.black,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            );
          });
    }

    void _settingModalBottomSheet(context) {
      showModalBottomSheet(
          context: context,
          builder: (BuildContext bc) {
            return StatefulBuilder(
                builder: (context, setState) {
                  return Container(height: 300,
                    decoration:  BoxDecoration(
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
                          Center(
                            child: SizedBox(
                              height: 35,
                              child: ListView.builder(
                                  itemCount: CustomData.colorList.length,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    return GestureDetector(onTap: (){
                                      setState(() {
                                        selectedColorIndex = index;
                                        selectedColor = CustomData.colorList[index].toString();
                                      });

                                    },
                                      child: Container(
                                        height: 35,
                                        width: 35,
                                        child: Center(child: Visibility(visible: selectedColorIndex == index,
                                            child: Icon(Icons.check,size: 20,color: Colors.white,)),),
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(50),
                                            color: Color(int.parse(CustomData.colorList[index]))),
                                        margin: EdgeInsets.only(
                                            right: index != 0 ? 10 : 0,
                                            left: index == 1 ? 10 : 0),
                                      ),
                                    );
                                  }),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          modalSheetOptions()
                        ],
                      ),
                    ),
                  );
                },
            );
          });
    }
    
    return  Scaffold(
      appBar:AppBar(automaticallyImplyLeading: false,
      backgroundColor: ColorUtils.appLogoColor.withOpacity(0.7),
      title: Row(
        children: [
          Spacer(),
          Center(
            child: CustomText(
              text: widget.addedNote == null ? 'Add Notes' : widget.addedNote?.title??"",
              fontSize: 18.0,
              color: Colors.black,
              fontWeight: FontWeight.w700,
              textAlign: TextAlign.center,
            ),
          ),

          Spacer(),
          
          GestureDetector(child: Icon(Icons.more_vert_sharp),onTap: (){
            _settingModalBottomSheet(context);
          },)
        ],
      ),
    ),

    body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 20,left: 10,right: 10),
        child: Column(mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.start,
        children: [

         // noteEditBar(),

          SizedBox(height: 20,),

          titleField(),

          SizedBox(height: 10,),

          contentField(),

          SizedBox(height: 20,),
        //
        // TextField(
        //   controller: MultiStyleTextEditingController()
        //     ..text = "This is blue text and this is italic",
        // )

          saveButton()

        ],),
      ),
    ),);
  }

  void _toggleBold() {
    setState(() {
      _isBold = !_isBold;

      // Get the selected text range
      TextSelection selectedText = contentController.selection;

      print(selectedText);
      // Apply the bold style to the selected text
      contentController.value = TextEditingValue(
        text: contentController.text,
        selection: selectedText,
      );
    });
  }

  void saveNote()async{

    if(widget.addedNote != null){
      Note notesData = Note(id:widget.addedNote?.id,title: titleController.text, content: contentController.text, createdAt: DateTime.now().toString(), category: "Test",color: selectedColor == null ? ColorUtils.cardColor1.toString() : selectedColor);
      try {
        // Call insertNote function
        int insertedNoteId = await notesDatabaseManager.updateNote(notesData);;
        print('Inserted note with ID: $insertedNoteId');
      } catch (e) {
        print('Error inserting note: $e');
      } finally {
        // Close the database when done (optional)
        // await notesDatabaseManager.closeDatabase();
      }
    } else {
    Note notesData = Note(title: titleController.text, content: contentController.text, createdAt: DateTime.now().toString(), category: "Test",color: selectedColor == null ? ColorUtils.cardColor1.toString() : selectedColor);
    try {
      // Call insertNote function
      int insertedNoteId = await notesDatabaseManager.insertNote(notesData);;
      print('Inserted note with ID: $insertedNoteId');
    } catch (e) {
      print('Error inserting note: $e');
    } finally {
      // Close the database when done (optional)
      // await notesDatabaseManager.closeDatabase();
    } }
  }

  void previousNote(Note? previousNotes){
    if(previousNotes != null) {
      titleController.text = previousNotes.title??"";
      contentController.text = previousNotes.content;
      selectedColor = previousNotes.color??"";
    }
  }


}
