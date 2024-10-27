import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note/cubits/notes_cubit/notes_cubit.dart';
import 'package:note/models/note_model.dart';
import 'package:note/views/widgets/note_item.dart';

class NotesListViewBuilder extends StatelessWidget {
  const NotesListViewBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NotesCubit, NotesState>(
      listener: (context, state) {},
      builder: (context, state) {
        List<NoteModel> notes = BlocProvider.of<NotesCubit>(context).notes;
        return Expanded(
          child: ListView.builder(
            // dragStartBehavior: DragStartBehavior.down,
            itemCount: notes.length,
            itemBuilder: (context, index) {
              return NoteItem(
                noteModel: notes[index],
              );
            },
          ),
        );
      },
    );
  }
}
