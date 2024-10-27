import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:note/consts.dart';
import 'package:note/models/note_model.dart';

part 'edit_note_state.dart';

class EditNoteCubit extends Cubit<EditNoteState> {
  EditNoteCubit() : super(EditNoteInitialState());
  static EditNoteCubit get(context) => BlocProvider.of(context);
  editNote(NoteModel note) {
    var noteBox = Hive.box<NoteModel>(knoteBox);
    noteBox.put(note.title, note);
  }
}
