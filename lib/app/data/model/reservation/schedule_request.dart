class ScheduleRequest {
  int venueId;
  int date;
  int? txId;

  ScheduleRequest({required this.venueId, required this.date, this.txId});
}
