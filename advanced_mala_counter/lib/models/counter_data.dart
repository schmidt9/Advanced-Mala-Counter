class CounterData {
  final String? userUid;
  final String title;
  final int created;
  final int cycleLength;
  final int todayCount;
  final int totalCount;

  const CounterData(
      {required this.title,
      required this.created,
      required this.cycleLength,
      required this.todayCount,
      required this.totalCount,
      this.userUid});

  Map<String, dynamic> toMap() {
    return {
      'user_uid': userUid,
      'title': title,
      'created': created,
      'cycle_length': cycleLength,
      'today_count': todayCount,
      'total_count': totalCount
    };
  }
}
