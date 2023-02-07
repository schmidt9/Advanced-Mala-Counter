import 'package:flutter/cupertino.dart';

class Counter extends StatelessWidget {

  const Counter({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(children: const [
          Text("Title"),
          Spacer(),
          Text("Date")
        ],)
      ],
    );
  }

}