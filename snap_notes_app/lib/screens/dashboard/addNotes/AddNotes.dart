import 'package:flutter/material.dart';

import '../../../utils/ColorUtils.dart';
import '../../../utils/FontUtils.dart';
import '../../../widgets/customMultiStyleTextfield/CustomMultiStyleTextField.dart';

class AddNotes extends StatefulWidget {
  const AddNotes({super.key});

  @override
  State<AddNotes> createState() => _AddNotesState();
}

class _AddNotesState extends State<AddNotes> {

  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();
  bool _isBold = false;

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
      );
    }
    
    return  Scaffold(
      appBar:AppBar(automaticallyImplyLeading: false,
      backgroundColor: ColorUtils.appLogoColor.withOpacity(0.7),
      title: Center(
        child: CustomText(
          text: 'Add Notes',
          fontSize: 18.0,
          color: Colors.black,
          fontWeight: FontWeight.w700,
          textAlign: TextAlign.center,
        ),
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

        //   SizedBox(height: 10,),
        //
        // TextField(
        //   controller: MultiStyleTextEditingController()
        //     ..text = "This is blue text and this is italic",
        // )

          //saveButton()

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
}
