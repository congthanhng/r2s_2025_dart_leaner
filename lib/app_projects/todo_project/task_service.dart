import 'dart:convert';

import 'package:dart_learner/app_projects/todo_project/task.dart';
import 'package:http/http.dart' as http;

import 'mock_data.dart';

class TaskService {
  static const domain = '64a6aa3e096b3f0fcc803bf4.mockapi.io';
  static const header = {
    'Content-Type': 'application/json',
  };

  static Future<List<Task>> getTasksFromServer() async {
    var url = Uri.https(domain, 'api/task');
    var response = await http.get(url);
    // if(response.statusCode != 200) {
    //   //error
    // }
    await Future.delayed(Duration(seconds: 3));
    // final response = taskMockDataJson;
    final listJson = jsonDecode(response.body) as List<dynamic>;

    final List<Task> results = listJson.map((e) => Task.fromJson(e)).toList();
    return results;
  }

  static Future<Task> createNewTask({required String taskName}) async {
    var url = Uri.https(domain, 'api/task');
    final taskRequestData = {"Name": taskName, "isCompleted": false};

    final json = jsonEncode(taskRequestData);

    var response = await http.post(url, headers: header, body: json);

    final data = jsonDecode(response.body) as Map<String, dynamic>;
    final Task task = Task.fromJson(data);

    return task;
  }

  static Future<Task> updateTask(
      {required String id, required bool isCompleted}) async {
    var url = Uri.https(domain, 'api/task/$id');
    final taskRequestData = {
      // "Name": taskName,
      "isCompleted": isCompleted
    };
    //
    final json = jsonEncode(taskRequestData);
    //
    var response = await http.put(url, headers: header, body: json);
    //
    final data = jsonDecode(response.body) as Map<String, dynamic>;
    final Task task = Task.fromJson(data);

    return task;
  }

  static Future<bool> deleteTask({required String id}) async {
    var url = Uri.https(domain, 'api/task/$id');

    var response = await http.delete(
      url,
      headers: header,
    );
    if (response.statusCode == 200) return true;

    return false;
  }

}
