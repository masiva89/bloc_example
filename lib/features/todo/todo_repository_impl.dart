import 'dart:developer';

import 'package:bloc_pattern_example/features/todo/service/todo_service.dart';

import 'model/data.dart';

class TodoRepositoryImpl implements TodoRepository {
  TodoService service = TodoService();

  @override
  Future<List<Data>> fetchData() {
    log("=== TodoRepositoryImpl on ===");
    log("Method is running { Future<List<Data>> fetchData() }");
    log("* This method using TodoService to fetch data { returns service.fetchData() }");
    log("//**// TodoRepository.fetchData() closed. //**// ");
    return service.fetchData();
  }
}

abstract class TodoRepository {
  Future<List<Data>> fetchData();
}
