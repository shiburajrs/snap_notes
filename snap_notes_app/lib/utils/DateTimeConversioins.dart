import 'package:intl/intl.dart';

class DateTimeConversions {

  static String extractDate(String dateTimeString){
    DateTime dateTime = DateTime.parse(dateTimeString);

    // Format the DateTime object to your desired format
    String formattedDate = DateFormat('dd-MM-yyyy').format(dateTime);
    return formattedDate;
  }

}