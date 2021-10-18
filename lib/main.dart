import 'package:anima_quiz/buisness_logic/cubits/dropdown_cubit.dart';
import 'package:anima_quiz/presentation/pages/home.dart';
import 'package:anima_quiz/presentation/pages/other.dart';
import 'package:anima_quiz/presentation/pages/quiz.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import 'buisness_logic/cubits/view_cubit.dart';
import 'presentation/screens/screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final Future<FirebaseApp> _init = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return Provider<ViewCubit>(
      create: (context) => ViewCubit('home'),
      child: BlocBuilder<ViewCubit, String>(builder: (context, view) {
        return MaterialApp(
          title: 'Questions/Réponses',
          theme: ThemeData(
            primarySwatch: Colors.blueGrey,
          ),
          home: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: const Text('Questions/Réponses'),
              leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  context.read<ViewCubit>().setValue('home');
                },
              ),
            ),
            backgroundColor: Colors.blueGrey,
            body: Screen(init: _init),
          ),
        );
      }),
    );
  }
}
