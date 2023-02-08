import 'package:clock_painter/pages/clock_examples/clock_two/widgets/clock_two_widget.dart';
import 'package:flutter/material.dart';

class ClockTwoPage extends StatelessWidget {
  const ClockTwoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2D2F41),
      appBar: AppBar(
        title: const Text("Clock Two"),
      ),
      body: Container(
        alignment: Alignment.center,
        child: const ClockTwoWidget(),
      ),
    );
  }
}