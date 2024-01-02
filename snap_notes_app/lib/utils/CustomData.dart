
import '../models/NotesOptionModel.dart';
import 'ColorUtils.dart';

class CustomData {

  static List<NoteOptionsModel> notesOptionsData= [
    NoteOptionsModel(image: "delete.png", title: "Delete Note"),
    NoteOptionsModel(image: "edit.png", title: "Edit Note"),
    NoteOptionsModel(image: "copy.png", title: "Copy Note"),
    NoteOptionsModel(image: "share.png", title: "Share as pdf"),
    NoteOptionsModel(image: "tag.png", title: "Add Label")
  ];

  static List colorList = [ColorUtils.cardColor1,ColorUtils.cardColor2,ColorUtils.cardColor3,ColorUtils.cardColor4,ColorUtils.cardColor5,
    ColorUtils.cardColor6,ColorUtils.cardColor7];
}