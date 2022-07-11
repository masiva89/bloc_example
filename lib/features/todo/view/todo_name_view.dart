import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/todo_bloc.dart';
import '../cubit/todo_cubit.dart';

class TodoNameView extends StatelessWidget {
  const TodoNameView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    log("*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-* BUILDING SCREEN *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*");
    return Scaffold(
      appBar: AppBar(
        title: const Text("List of Todo"),
      ),
      body: Center(child: BlocBuilder<TodoCubit, TodoState>(
        builder: (context, state) {
          log("*-* BlocBuilder executes. { <TodoCubit, TodoState> }");
          log("* The state's type is ${state.runtimeType}");

          if (state is TodoInitial) {
            log("* If state is { TodoInitial } let's try fetch data by using this:\n { context.read<TodoCubit>().getData() }");
            context.read<TodoCubit>().getData().then((value) {
              log("* This operation ok. Go for { context.read<TodoBloc>().add(TodoFetched()) }");
              context.read<TodoBloc>().add(TodoFetched());
            });
            return showLoader();
          } else if (state is TodoLoaded) {
            log("* We can build our listview cuz State is { TodoLoaded }");
            return ListView.builder(
              itemCount: state.data.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: ListTile(
                    title: Text(state.data[index].title),
                    subtitle: Text(state.data[index].userId.toString()),
                    trailing: Text(state.data[index].completed.toString()),
                  ),
                );
              },
            );
          } else {
            return const CircularProgressIndicator();
          }
        },
      )),
    );
  }

  Widget showLoader() {
    log("*-* showLoader() executes. *-*");
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
