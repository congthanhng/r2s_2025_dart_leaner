part of 'task_bloc.dart';

@immutable
sealed class TaskEvent {}

class TaskRefreshed extends TaskEvent{}

class TaskCreatedNew extends TaskEvent{}
