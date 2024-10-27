import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:note/bloc_observer.dart';
import 'package:note/consts.dart';
import 'package:note/cubits/notes_cubit/notes_cubit.dart';
import 'package:note/models/note_model.dart';
import 'package:note/views/notes_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  Hive.registerAdapter(NoteModelAdapter());

  await Hive.openBox<NoteModel>(knoteBox);
  Bloc.observer = MyBlocObserver();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) {
          return BlocProvider(
            create: (context) => NotesCubit()..readAllNotes(),
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData.dark(
                useMaterial3: true,
              ),
              home: const NotesScreen(),
            ),
          );
        });
  }
}
