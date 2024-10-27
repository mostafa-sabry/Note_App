import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:note/consts.dart';
import 'package:note/cubits/add_note_cubit/add_note_state.dart';
import 'package:note/models/note_model.dart';

class AddNoteCubit extends Cubit<AddNoteStates> {
  AddNoteCubit() : super(NoteInitioalState());

  static AddNoteCubit get(context) => BlocProvider.of(context);

  addNote(NoteModel note) async {
    emit(
      AddNoteLoadState(),
    );
    try {
      var noteBox = Hive.box<NoteModel>(knoteBox);
      await noteBox.add(note);
      emit(
        AddNoteSuccessState(),
      );
    } catch (e) {
      emit(
        AddNoteErrorState(error: e.toString()),
      );
    }
  }
}
