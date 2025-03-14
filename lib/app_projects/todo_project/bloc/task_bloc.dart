import 'package:meta/meta.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../task.dart';
import '../task_service.dart';

part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  TaskBloc() : super(TaskInitial()) {
    on<TaskRefreshed>((event, emit) async {
      emit(TaskLoading());
      List<Task> tasks = await TaskService.getTasksFromServer();
      emit(TaskRefreshedSuccess(tasksFromServer: tasks));
    });

    on<TaskCreatedNew>((event, emit) async {
      final name = event.name;
      await TaskService.createNewTask(taskName: name);
      add(TaskRefreshed());
    });
  }
}
