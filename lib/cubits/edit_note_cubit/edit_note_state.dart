part of 'edit_note_cubit.dart';

@immutable
sealed class EditNoteState {}

final class EditNoteInitialState extends EditNoteState {}

final class EditNoteSuccessState extends EditNoteState {}

final class EditNoteErrorState extends EditNoteState {}

final class EditNoteLoadingState extends EditNoteState {}
