import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:todo_app/models/todo.dart';

class TodoRepository {
  final _baseUrl = 'https://619ee9581ac52a0017ba456b.mockapi.io/';

  Future getAllData() async {
    try {
      final response = await http.get(Uri.parse(_baseUrl + 'todos'));

      if (response.statusCode == 200) {
        Iterable it = jsonDecode(response.body);
        List<Todo> data = it.map((e) => Todo.fromJson(e)).toList();
        return data;
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future getDataById(String id) async {
    try {
      final response = await http.get(Uri.parse(_baseUrl + 'todos' + id));

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future createData(String title, String body) async {
    try {
      final response = await http.post(Uri.parse(_baseUrl + 'todos'),
          body: {"title": title, "body": body});

      if (response.statusCode == 201) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future destroyData(String id) async {
    try {
      final response = await http.delete(Uri.parse(_baseUrl + 'todos/' + id));

      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
