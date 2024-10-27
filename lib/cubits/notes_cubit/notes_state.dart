part of 'notes_cubit.dart';

@immutable
sealed class NotesState {}

final class NotesInitial extends NotesState {}

class ReadNoteErrorState extends NotesState {
  final String error;
  ReadNoteErrorState({
    required this.error,
  });
}

class ReadNoteSuccessState extends NotesState {
  final List<NoteModel> notes;
  ReadNoteSuccessState({
    required this.notes,
  });
}

class ReadNoteLoadState extends NotesState {}
