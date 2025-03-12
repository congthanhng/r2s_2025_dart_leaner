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
  final DateTime? createdDate;
  final DateTime? updatedDate;
  final String? restaurantId;
  final String? restaurantName;
  final int? peopleCount;
  final String? timeRange;
  final ReservationStatus? status;

  Reservation({
    this.id,
    this.createdDate,
    this.updatedDate,
    this.restaurantId,
    this.restaurantName,
    this.peopleCount,
    this.timeRange,
    this.status = ReservationStatus.pending,
  });

  static Reservation fromJson(Map<String, dynamic> json) {
    return Reservation(
      status: ReservationStatus.fromString(json['status'] as String)
    );
  }
}
