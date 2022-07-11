import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../cubit/todo_cubit.dart';
import '../model/data.dart';
import '../todo_repository_impl.dart';

part 'todo_event.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final TodoRepository _todoRepository;
  TodoBloc(this._todoRepository) : super(TodoInitial()) {
    on<TodoEvent>((event, emit) async {
      log("=== TodoBloc on ===");
      try {
        log("* Trying to fetch data from api { BLoC }");
        List<Data> data = await _todoRepository.fetchData();
        log("* Data fetched successful!");
        log("* Our data length is: ${data.length}");
        log("* Data will be emitted by { emit(TodoLoaded(data: data)) }");
        emit(TodoLoaded(data: data));
        log("++ Emit data has been DONE ++");
        log("//**// TodoBloc.on<TodoEvent>() closed. //**// ");
      } on Exception {
        log("**error** Err while fetching or emitting data **error**");
        emit(TodoError(
            message: "Couldn't fetch the list, please try again later!"));
      }
    });
  }
}
