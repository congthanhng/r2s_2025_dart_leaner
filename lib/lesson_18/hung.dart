sealed class ReservationDetailEvent {}

class FetchReservationDetail extends ReservationDetailEvent {
  final String reservationId;
  FetchReservationDetail({required this.reservationId});
}

sealed class ReservationDetailState {}

class ReservationDetailInitial extends ReservationDetailState {}

class ReservationDetailLoading extends ReservationDetailState {}

class ReservationDetailSuccess extends ReservationDetailState {
  final String reservationId;
  ReservationDetailSuccess({required this.reservationId});
}

class ReservationDetailError extends ReservationDetailState {
  final String message;
  ReservationDetailError({required this.message});
}



class ReservationDetailBloc
    extends Bloc<ReservationDetailEvent, ReservationDetailState> {
  ReservationDetailBloc() : super(ReservationDetailInitial()) {
    on<FetchReservationDetail>((event, emit) async {
      emit(ReservationDetailLoading());
      // Fetch data from API
      emit(ReservationDetailSuccess(reservationId: ""));
    });
  }
}
