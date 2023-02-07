import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Counter extends StatelessWidget {
  const Counter({super.key});

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
            Row(
              children: [
                Column(
                  children: [
                    Text("Today"),
                    Text("0"),
                    Text("Total"),
                    Text("0"),
                  ],
                ),
                Column(
                  children: [
                    Text("108 x"),
                    Text("0"),
                    Text("Total"),
                    Text("0"),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
