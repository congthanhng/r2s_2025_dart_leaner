import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dart_learner/app_projects/booking_project/models/restaurant_model.dart';
import 'package:meta/meta.dart';

part 'history_event.dart';
part 'history_state.dart';

class HistoryBloc extends Bloc<HistoryEvent, HistoryState> {
  HistoryBloc() : super(HistoryInitial()) {
    on<HistoryFetchReservation>((event, emit) async{
      emit(HistoryLoading());
      await Future.delayed(Duration(seconds: 3));
      //TODO: History service
      final result = mockRestaurant;
      emit(HistoryFetchReservationSuccess(result));
    });
    
  }
}
