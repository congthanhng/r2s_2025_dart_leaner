import 'dart:convert';

import 'package:dart_learner/app_projects/todo_project/task.dart';
import 'package:http/http.dart' as http;

class TaskService {
  static const domain = '64a6aa3e096b3f0fcc803bf4.mockapi.io';
  static const header = {
    'Content-Type': 'application/json',
  };

  static Future<List<Task>> getTasksFromServer() async {
    var url = Uri.https(domain, 'api/task');
    var response = await http.get(url);
    final listJson = jsonDecode(response.body) as List<dynamic>;

    final List<Task> results = listJson.map((e) => Task.fromJson(e)).toList();
    return results;
  }

  static Future<Task> createNewTask({required String taskName}) async {
    var url = Uri.https(domain, 'api/task');
    final taskRequestData = {
      "Name": taskName,
      "isCompleted": false
    };

    final json = jsonEncode(taskRequestData);

    var response = await http.post(url, headers: header, body: json);

    final data = jsonDecode(response.body) as Map<String, dynamic>;
    final Task task = Task.fromJson(data);

    return task;
  }
}
