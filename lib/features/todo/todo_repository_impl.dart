import 'package:bloc_pattern_example/features/todo/service/todo_service.dart';

import 'model/data.dart';

class TodoRepositoryImpl implements TodoRepository {
  TodoService service = TodoService();

  @override
  Future<List<Data>> fetchData() {
    return service.fetchData();
  }
}

abstract class TodoRepository {
  Future<List<Data>> fetchData();
}
