
import 'package:flutter_email_sender/flutter_email_sender.dart';

class FeedbackManager {
  Future<bool> sendFeedback(String subject, String content) async {
    final Email email = Email(
      body: content,
      subject: subject,
      recipients: ["shiburaj525@gmail.com"],
    );

   bool platformResponse;

    try {
      await FlutterEmailSender.send(email);
      platformResponse = true;
    } catch (error) {
      print(error);
      platformResponse = false;
    }

    return platformResponse;
  }
}