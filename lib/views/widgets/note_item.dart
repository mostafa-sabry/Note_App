import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:note/cubits/notes_cubit/notes_cubit.dart';
import 'package:note/models/note_model.dart';
import 'package:note/views/edit_note_view.dart';

class NoteItem extends StatelessWidget {
  final NoteModel noteModel;

  const NoteItem({super.key, required this.noteModel});
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(noteModel.color),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EditNoteView(noteModel: noteModel),
                  ),
                );
              },
              contentPadding: EdgeInsets.all(5),
              title: Text(
                noteModel.title,
                style: TextStyle(
                  fontSize: 20.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                noteModel.details,
                style: TextStyle(fontSize: 16.sp, color: Colors.black),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              trailing: IconButton(
                onPressed: () {
                  noteModel.delete();
                  BlocProvider.of<NotesCubit>(context).readAllNotes();
                },
                icon: const Icon(Icons.delete, color: Colors.black),
              ),
            ),
            Text(
              noteModel.dateTime,
              style: const TextStyle(
                height: 2.5,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
