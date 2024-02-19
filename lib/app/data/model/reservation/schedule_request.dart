class ScheduleRequest {
  int venueId;
  int date;
  String? txId;

  ScheduleRequest({required this.venueId, required this.date, this.txId});
}
