import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note/cubits/edit_note_cubit/edit_note_cubit.dart';
import 'package:note/cubits/notes_cubit/notes_cubit.dart';
import 'package:note/models/note_model.dart';
import 'package:note/views/widgets/custom_text_form_field.dart';
import 'package:note/views/widgets/cuustom_app_bar.dart';

class EditNoteView extends StatelessWidget {
  const EditNoteView({super.key, required this.noteModel});
  final NoteModel noteModel;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EditNoteCubit(),
      child: Scaffold(
        body: SafeArea(
            child: EditNoteBody(
          noteModel: noteModel,
        )),
      ),
    );
  }
}

class EditNoteBody extends StatefulWidget {
  final NoteModel noteModel;

  EditNoteBody({super.key, required this.noteModel});

  @override
  State<EditNoteBody> createState() => _EditNoteBodyState();
}

class _EditNoteBodyState extends State<EditNoteBody> {
  TextEditingController? editTitleController = TextEditingController();

  TextEditingController? editDetailsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          CustomAppBar(
            title: "Edit Note",
            icon: const Icon(
              Icons.done_outline_rounded,
            ),
            onPressed: () {
              editNote(context);
            },
          ),
          CustomTextField(
            labelText: 'Title',
            controller: editTitleController,
            hintText: widget.noteModel.title,
            onChanged: (value) {
              editTitleController!.text = value;
            },
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          CustomTextField(
            labelText: 'Details',
            controller: editDetailsController,
            maxLines: 6,
            hintText: widget.noteModel.details,
            onChanged: (value) {
              editDetailsController!.text = value;
            },
          ),
        ],
      ),
    );
  }

  void editNote(BuildContext context) {
    widget.noteModel.title =
        editTitleController?.text ?? widget.noteModel.title;
    widget.noteModel.details =
        editDetailsController?.text ?? widget.noteModel.details;
    widget.noteModel.save();
    BlocProvider.of<NotesCubit>(context).readAllNotes();
    Navigator.pop(context);
  }
}
