part of 'todo_cubit.dart';

@immutable
sealed class TodoState {}

final class TodoInitial extends TodoState {}

final class TodoRefreshedSuccess extends TodoState {
  final List<Task> tasksFromServer;

  TodoRefreshedSuccess({required this.tasksFromServer});
}

final class TodoLoading extends TodoState {}

final class TodoLoadFailure extends TodoState {}

