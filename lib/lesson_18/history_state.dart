part of 'history_bloc.dart';

@immutable
sealed class HistoryState {}

final class HistoryInitial extends HistoryState {}

final class HistoryLoading extends HistoryState {}

final class HistoryFetchReservationSuccess extends HistoryState {
  final Reservation? reservation;

  HistoryFetchRestaurantSuccess(this.reservation);
}


