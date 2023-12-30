import 'package:snap_notes_app/models/GeneralOptionsModel.dart';

class DataUtils {


  static List<GeneralOptionsModel> generalOptions(){
    List<GeneralOptionsModel> dataModel = [
      GeneralOptionsModel(icon: "", title: "Theme"),
      GeneralOptionsModel(icon: "", title: "Notifications"),
      GeneralOptionsModel(icon: "", title: "Backup"),
      GeneralOptionsModel(icon: "", title: "Recycler Bin"),
    ];
    return dataModel;
  }


  static List<GeneralOptionsModel> feedbackOptions(){
    List<GeneralOptionsModel> dataModel = [
      GeneralOptionsModel(icon: "", title: "Report a bug"),
      GeneralOptionsModel(icon: "", title: "Feedback"),
    ];
    return dataModel;
  }
}