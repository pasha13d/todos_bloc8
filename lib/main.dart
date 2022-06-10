import 'package:block_8_todo/bloc/todos_filter/todos_filter_bloc.dart';
import 'package:block_8_todo/screen/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/todos/todos_bloc.dart';
import 'model/todos_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => TodosBloc()
            ..add(LoadTodos(todos: [
              Todo(
                id: '1',
                task: 'Sample Todo 1',
                description: 'This is a test todo',
              ),
              Todo(
                id: '2',
                task: 'Sample Todo 2',
                description: 'This is a test todo',
              ),
            ])),
        ),
        BlocProvider(
          create: (context) => TodosFilterBloc(
            todosBloc: BlocProvider.of<TodosBloc>(context),
          ),
        ),
      ],
      child: MaterialApp(
        title: 'Bloc pattern- TODO',
        theme: ThemeData(
            primarySwatch: Colors.blue,
            primaryColor: Color(0xFF000A1F),
            appBarTheme: AppBarTheme(
              color: Color(0xFF000A1F),
            )),
        home: HomePage(),
      ),
    );
  }
}
