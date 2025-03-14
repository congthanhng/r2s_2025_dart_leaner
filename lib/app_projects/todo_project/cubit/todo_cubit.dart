import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../task.dart';
import '../task_service.dart';

part 'todo_state.dart';

class TodoCubit extends Cubit<TodoState> {
  TodoCubit() : super(TodoInitial());

  void deleteTask(String taskId) async {
    await TaskService.deleteTask(id: taskId);
    refreshData();
  }

  void refreshData()async{
    emit(TodoLoading());
    List<Task> tasks = await TaskService.getTasksFromServer();
    emit(TodoRefreshedSuccess(tasksFromServer: tasks));
  }
}
