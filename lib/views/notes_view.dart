import 'package:flutter/material.dart';
import 'package:note/views/widgets/add_note_bottomSheet.dart';
import 'package:note/views/widgets/notes_view_body.dart';

class NotesScreen extends StatelessWidget {
  const NotesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              isScrollControlled: true,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              context: context,
              builder: (context) {
                return AddNoteBottomSheet();
              });
        },
        child: const Icon(
          Icons.add,
        ),
      ),
      body: const SafeArea(
        child: NotesViewBody(),
      ),
    );
  }
}
