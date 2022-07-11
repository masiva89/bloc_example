import 'package:bloc/bloc.dart';
import 'package:bloc_pattern_example/features/todo/view/todo_name_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/todo_bloc_observer.dart';
import 'features/todo/cubit/todo_cubit.dart';
import 'features/todo/todo_repository_impl.dart';

void main() {
  BlocOverrides.runZoned(
    () => const MyApp(),
    blocObserver: TodoBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BloC Pattern Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (context) => TodoCubit(TodoRepositoryImpl()),
        child: const TodoNameView(),
      ),
    );
  }
}
