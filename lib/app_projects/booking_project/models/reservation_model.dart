import 'package:dart_learner/app_projects/booking_project/models/restaurant_model.dart';
import 'package:dart_learner/app_projects/booking_project/models/user_model.dart';

enum ReservationStatus {
  finished,
  pending,
  cancelled,
  deposited,
  confirmed;

  static ReservationStatus fromString(String status) {
    switch (status) {
      case 'finished':
        return ReservationStatus.finished;
      case 'pending':
        return ReservationStatus.pending;
      case 'cancelled':
        return ReservationStatus.cancelled;
      case 'deposited':
        return ReservationStatus.deposited;
      case 'confirmed':
        return ReservationStatus.confirmed;
      default:
        return ReservationStatus.pending;
    }
  }
}

class Reservation {
  final String? id;
  DateTime? createdDate;
  DateTime? updatedDate;
  Restaurant? restaurantInfo;
  int? peopleCount;
  String? timeRange;
  ReservationStatus? status;
  User?  userInfo;
  String? notes;

  Reservation({
    this.id,
    this.createdDate,
    this.updatedDate,
    this.peopleCount,
    this.timeRange,
    this.status = ReservationStatus.pending,
    this.restaurantInfo,
    this.userInfo,
    this.notes,
  });

  static Reservation fromJson(Map<String, dynamic> json) {
    return Reservation(
      status: ReservationStatus.fromString(json['status'] as String)
    );
  }
}
