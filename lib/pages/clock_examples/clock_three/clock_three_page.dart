import 'dart:async';

import 'package:clock_painter/pages/clock_examples/clock_three/widgets/clock_three_widget.dart';
import 'package:flutter/material.dart';

class ClockThreePage extends StatefulWidget {

  const ClockThreePage({ Key? key }) : super(key: key);

  @override
  State<ClockThreePage> createState() => _ClockThreePageState();
}

class _ClockThreePageState extends State<ClockThreePage> {

  DateTime current = DateTime.now();

  late Timer timer;

  @override
  void initState() {
    super.initState();

    timer = Timer.periodic(const Duration(seconds: 1), (timer) { 
      setState(() {
        current = current.add(const Duration(seconds: 1));
      });
    });
  }

  @override
  void dispose() {
    
    timer.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Clock Three'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Exercício prático :)",
              style: TextStyle(
                color: Colors.black87,
                fontSize: 16,
              ),
            ),

            const Divider(
              height: 30,
            ),

            Text(
              _formatTime(current),
              style: const TextStyle(
                color: Colors.black87,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(
              height: 30,
            ),

            ClockThreeWidget(
              date: current,
            ),
          ],
        ),
      ),
    );
  }

  String _formatTime(DateTime date) {
    final hours = date.hour.toString().padLeft(2,"0");
    final minutes = date.minute.toString().padLeft(2,"0");
    final seconds = date.second.toString().padLeft(2,"0");

    return "$hours:$minutes:$seconds";
  }
}