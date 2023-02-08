import 'package:advanced_mala_counter/models/counter_data.dart';
import 'package:advanced_mala_counter/helpers/cycle_helper.dart';
import 'package:flutter/material.dart';

class Counter extends StatelessWidget {
  final CounterData counterData;

  const Counter({super.key, required this.counterData});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.black12,
          borderRadius: BorderRadius.all(Radius.circular(8))),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  "Title",
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const Spacer(),
                Text("Date", style: Theme.of(context).textTheme.headlineSmall)
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Today"),
                    Text("${counterData.todayCount} (${counterData.cycleLength} x ${CycleHelper.getCycles(counterData.todayCount, counterData.cycleLength)})"),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Total"),
                    Text("${counterData.totalCount} (${counterData.cycleLength} x ${CycleHelper.getCycles(counterData.totalCount, counterData.cycleLength)})"),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
