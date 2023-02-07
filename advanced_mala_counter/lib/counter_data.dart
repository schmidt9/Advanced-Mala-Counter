class CounterData {
  final String counterName;
  final String counterDateTime;
  final int cycleLength;
  final int todayCount;
  final int totalCount;

  const CounterData(
      {required this.counterName,
      required this.counterDateTime,
      required this.cycleLength,
      required this.todayCount,
      required this.totalCount});
}
