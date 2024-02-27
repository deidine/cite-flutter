class ReservationResponse {
  final int? transactionId;
  final int? venueId;
  int? userId;
  final String beginTime;
  final String endTime;
  final String bookingTime;
  final int hours;
  final int totalPrice;
  final String? status;

  ReservationResponse({
    this.transactionId,
    this.venueId,
    this.userId,
    required this.beginTime,
    required this.endTime,
    required this.bookingTime,
    required this.hours,
    required this.totalPrice,
    this.status,
  });

  factory ReservationResponse.fromJson(Map<String, dynamic> json) {
    return ReservationResponse(
      transactionId: json['transactionId'],
      venueId: json['venueId'],
      userId: json['userId'],
      beginTime:  json['beginTime'],
      endTime:  json['endTime'],
      bookingTime: json['bookingTime'],
      hours: json['hours'],
      totalPrice: json['totalPrice'],
      status: json['status'],
    );
  }

  Map<String, dynamic> updateReservationToJson() {
    return {
      'transactionId': transactionId,
      'beginTime': beginTime,
      'endTime': endTime,
      'hours': hours,
      'bookingTime': bookingTime,
      'totalPrice': totalPrice,
    };
  }

  Map<String, dynamic> createReservationToJson() {
    return {
      'venueId': venueId,
      'userId': userId,
      'beginTime': beginTime,
      'endTime': endTime,
      'hours': hours,
      'bookingTime': bookingTime,
      'totalPrice': totalPrice,
    };
  }
  
  Map<String, dynamic> editStatusToJson() {
    return {
      'venueId': venueId,
      'userId': userId,
      'beginTime': beginTime,
      'endTime': endTime,
      'hours': hours,
      'bookingTime': bookingTime,
      'totalPrice': totalPrice,
      'status': status,
    };
  }
}
