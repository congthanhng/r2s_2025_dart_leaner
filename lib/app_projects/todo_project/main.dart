import 'package:dart_learner/app_projects/booking_project/core/local_storage/app_prefrerence.dart';
import 'package:dart_learner/app_projects/todo_project/task_service.dart';
import 'package:flutter/material.dart';

import 'task.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppPreference.init();
  runApp(const TodoApp());
}

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Task> tasks = <Task>[];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome'),
        actions: [
          IconButton(onPressed: () async{
            final newTask = await showDialog(context: context, builder: (context) {
              String taskName = '';
              return AlertDialog(
                title: Text('Create new Task'),
                content: TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter task name',
                  ),
                  onChanged: (value) {
                    taskName = value;
                  },
                ),
                actions: [
                  TextButton(onPressed: () async{
                    //TODO: post to server
                    final result = await TaskService.createNewTask(taskName: taskName);
                    Navigator.pop(context, result);
                  }, child: Text('Save')),
                  TextButton(onPressed: () {
                    Navigator.pop(context);
                  }, child: Text('Cancel'))
                ],
              );
            },) as Task?;
            print('HELLO: ${newTask?.name}');
            if(newTask !=null){
              tasks = tasks.reversed.toList();
              tasks.add(newTask);
              tasks = tasks.reversed.toList();
              setState(() {});
            }

          }, icon: Icon(Icons.upload)),
          IconButton(onPressed: () async{
            //TODO fetch data from API
            tasks = await TaskService.getTasksFromServer();
            tasks = tasks.reversed.toList();
            setState(() {});
          }, icon: Icon(Icons.refresh))
        ],
      ),
      body: SafeArea(child: _buildLisTaskView(context)),
    );
  }

  Widget _buildLisTaskView(BuildContext context) {
    return ListView.builder(
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        return Card(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            spacing: 10,
            children: [
              Checkbox(
                value: tasks[index].isCompleted,
                onChanged: (value) {
                  //TODO
                },
              ),
              Text(tasks[index].name??'')
            ],
          ),
        );
      },
    );
  }
}
