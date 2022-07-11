import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

import '../model/data.dart';

class TodoService {
  Future<List<Data>> fetchData() async {
    log("=== TodoService on ===");
    log("* Trying to fetch data from given uri by using http.get");
    http.Response response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/todos'));
    log("! Response status code = ${response.statusCode}");
    if (response.statusCode == 200) {
      log("* So lets make { DataModel } by using fetched data's json");
      log("//**// TodoService.fetchData() closed. //**// ");
      return (jsonDecode(response.body) as List<dynamic>)
          .map((e) => Data.fromJson(e))
          .toList();
    } else {
      log("//**// TodoService.fetchData() closed. //**// ");
      throw Exception('**error** Failed to load todos **error**');
    }
  }
}
