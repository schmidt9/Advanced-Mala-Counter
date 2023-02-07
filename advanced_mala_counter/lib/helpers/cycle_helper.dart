class CycleHelper {

  static int getCycles(int totalCount, int cycleLength) {
    return cycleLength == 0 ? 0 : totalCount ~/ cycleLength;
  }

}