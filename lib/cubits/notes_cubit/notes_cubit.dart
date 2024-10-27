import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:note/consts.dart';
import 'package:note/models/note_model.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());
  List<NoteModel> notes = [];
  readAllNotes() async {
    var noteBox = Hive.box<NoteModel>(knoteBox);
    notes = noteBox.values.toList();
    emit(
      ReadNoteSuccessState(notes: notes),
    );
  }
}
