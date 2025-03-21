import 'package:dart_learner/app_projects/booking_project/core/local_storage/app_prefrerence.dart';
import 'package:dart_learner/app_projects/todo_project/bloc/task_bloc.dart';
import 'package:dart_learner/app_projects/todo_project/cubit/todo_cubit.dart';
import 'package:dart_learner/app_projects/todo_project/task_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    return MultiBlocProvider(
      providers: [
        BlocProvider<TaskBloc>(
          create: (context) => TaskBloc(),
        ),
        BlocProvider<TodoCubit>(
          create: (context) => TodoCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // List<Task> tasks = <Task>[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome'),
        actions: [
          IconButton(
              onPressed: () async {
                await showDialog(
                  context: context,
                  builder: (context) {
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
                        TextButton(
                            onPressed: () async {
                              //TODO: post to server
                              context
                                  .read<TaskBloc>()
                                  .add(TaskCreatedNew(taskName));
                              Navigator.pop(context);
                            },
                            child: Text('Save')),
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text('Cancel'))
                      ],
                    );
                  },
                ) as Task?;
              },
              icon: Icon(Icons.upload)),
          IconButton(
              onPressed: () async {
                // context.read<TaskBloc>().add(TaskRefreshed());
                context.read<TodoCubit>().refreshData();
              },
              icon: Icon(Icons.refresh))
        ],
      ),
      body: MultiBlocListener(
        listeners: [
          BlocListener<TaskBloc, TaskState>(
            listener: (context, state) {
              // TODO: implement listener
            },
          ),
          BlocListener<TodoCubit, TodoState>(
            listener: (context, state) {
              // TODO: implement listener
            },
          ),
        ],
        child: BlocBuilder<TodoCubit, TodoState>(
          builder: (context, state) {
            final isLoading = state is TodoLoading;
            List<Task> data = [];

            if (state is TodoRefreshedSuccess) {
              data = state.tasksFromServer;
            }
            return SafeArea(
                child: Stack(
              children: [
                _buildLisTaskView(context, data),
                if (isLoading) Center(child: CircularProgressIndicator()),
              ],
            ));
          },
        ),
      ),
    );
  }

  Widget _buildLisTaskView(BuildContext context, List<Task> tasks) {
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
                onChanged: (value) async {
                  final result = await TaskService.updateTask(
                      id: tasks[index].id ?? '', isCompleted: value ?? false);
                  final taskInList = tasks.firstWhere(
                    (element) => element.id == result.id,
                  );
                  taskInList.isCompleted = result.isCompleted;
                  setState(() {});
                },
              ),
              Text(tasks[index].name ?? ''),
              Spacer(),
              IconButton(
                  onPressed: () async {
                    context.read<TodoCubit>().deleteTask(tasks[index].id ?? '');
                  },
                  icon: Icon(
                    Icons.clear,
                    color: Colors.red,
                  ))
            ],
          ),
        );
      },
    );
  }
}

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskBloc, TaskState>(
      builder: (context, state) {
        return Scaffold(
          body: Center(
            child: Text('${state.runtimeType}'),
          ),
        );
      },
    );
  }
}
