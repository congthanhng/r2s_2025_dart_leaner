import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dart_learner/app_projects/booking_project/models/restaurant_model.dart';
import 'package:meta/meta.dart';

part 'reservation_event.dart';
part 'reservation_state.dart';

class ReservationBloc extends Bloc<ReservationEvent, ReservationState> {
  ReservationBloc() : super(ReservationInitial()) {
    on<ReservationFetchRestaurant>((event, emit) async{
      emit(ReservationLoading());
      await Future.delayed(Duration(seconds: 3));
      //TODO: reservation service
      final result = mockRestaurant;
      emit(ReservationFetchRestaurantSuccess(result));
    });
  }
}
