part of 'reservation_bloc.dart';

@immutable
sealed class ReservationEvent {}

class ReservationFetchRestaurant extends ReservationEvent {}

class ReservationConfirmed extends ReservationEvent{
  final Reservation reservation;

  ReservationConfirmed(this.reservation);
}
