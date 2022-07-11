import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../model/data.dart';
import '../todo_repository_impl.dart';

part 'todo_state.dart';

class TodoCubit extends Cubit<TodoState> {
  final TodoRepository _todoRepository;

  TodoCubit(this._todoRepository) : super(TodoInitial());

  Future<void> getData() async {
    log("=== TodoCubit on ===");
    try {
      log("* Trying to fetch data from api { Cubit }");
      List<Data> data = await _todoRepository.fetchData();
      log("* Data fetched successful!");
      log("* Our data length is: ${data.length}");
      log("* Data will be emitted by { emit(TodoLoaded(data: data)) now}");
      emit(TodoLoaded(data: data));
      log("++ Emit data has been DONE ++");
      log("//**// TodoCubit.getData() closed. //**// ");
    } on Exception {
      log("**error** Err while fetching or emitting data **error**");
      log("//**// TodoCubit.getData() closed. //**// ");
      emit(TodoError(
          message: "Could not fetch the list, please try again later!"));
    }
  }
}
