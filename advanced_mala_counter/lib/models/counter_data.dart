class CounterData {
  final int? id;
  final String title;
  final int created;
  final int cycleLength;
  final int todayCount;
  final int totalCount;

  const CounterData({
      required this.title,
      required this.created,
      required this.cycleLength,
      required this.todayCount,
      required this.totalCount,
      this.id});
}
