import 'package:flutter/material.dart';
import 'package:snap_notes_app/services/userFeedbackManager/FeedbackManager.dart';
import 'package:snap_notes_app/widgets/customSnackbars/CustomSnackbars.dart';

import '../../utils/ColorUtils.dart';
import '../../utils/FontUtils.dart';

class FeedbackPage extends StatefulWidget {
   FeedbackPage({super.key,required this.type});
  int type;

  @override
  State<FeedbackPage> createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {


  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();
  FeedbackManager feedbackManager = FeedbackManager();

  @override
  void initState() {
    super.initState();
    subjectByType(widget.type);
  }

  @override
  Widget build(BuildContext context) {
    Widget titleField() {
      return Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(8)),
        child: Padding(
          padding: EdgeInsets.only(left: 20, right: 20),
          child: TextField(
            controller: titleController,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
            decoration: const InputDecoration(
                border: InputBorder.none, hintText: "Subject"),
            keyboardType: TextInputType.text,
            maxLines: 1,
          ),
        ),
      );
    }

    Widget contentField() {
      return Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(10)),
        child: Padding(
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
            maxLines: 10,
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: ColorUtils.appLogoColor.withOpacity(0.7),
        title: Row(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back),
            ),
            Spacer(),
            CustomText(
              text: widget.type == 0 ? 'Report a bug':'Feedback',
              fontSize: 18.0,
              color: Colors.black,
              fontWeight: FontWeight.w700,
              textAlign: TextAlign.center,
            ),
            Spacer(),
            GestureDetector(
              onTap: () {
                sendFeedback();
              },
              child: Icon(Icons.send),
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 20, left: 15, right: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: 'Subject',
                fontSize: 14.0,
                color: Colors.black,
                fontWeight: FontWeight.w700,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 10,
              ),
              titleField(),
              SizedBox(
                height: 30,
              ),
              CustomText(
                text: 'Message',
                fontSize: 14.0,
                color: Colors.black,
                fontWeight: FontWeight.w700,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 10,
              ),
              contentField()
            ],
          ),
        ),
      ),
    );
  }

  void sendFeedback() async {
    String subject = titleController.text;
    String body = contentController.text;

    if (subject.isNotEmpty && body.isNotEmpty) {
      bool response = await feedbackManager.sendFeedback(
          titleController.text, contentController.text);
      if (response) {
        CustomSnacbars.successSnackBar(context, "Mail send Successfully");
      } else {
        CustomSnacbars.errorSnackBar(context, "Something went wrong");
      }
    } else {
      CustomSnacbars.errorSnackBar(context, "Subject or Body is Empty");
    }
  }

  void subjectByType(int type){
    if(type == 0){
      titleController.text = "Report a bug";
    } else {
      titleController.text = "";
    }
  }
}
