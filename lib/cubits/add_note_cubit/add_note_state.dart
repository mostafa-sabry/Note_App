// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:note/models/note_model.dart';

sealed class AddNoteStates {}

class NoteInitioalState extends AddNoteStates {}

class AddNoteErrorState extends AddNoteStates {
  String error;
  AddNoteErrorState({
    required this.error,
  });
}

class AddNoteSuccessState extends AddNoteStates {}

class AddNoteLoadState extends AddNoteStates {}

class ReadNoteErrorState extends AddNoteStates {
  String error;
  ReadNoteErrorState({
    required this.error,
  });
}

class ReadNoteSuccessState extends AddNoteStates {
  List<NoteModel> notes;
  ReadNoteSuccessState({
    required this.notes,
  });
}

class ReadNoteLoadState extends AddNoteStates {}
