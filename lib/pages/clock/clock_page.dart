import 'package:clock_painter/pages/clock/utils/clock_time_model.dart';
import 'package:clock_painter/pages/clock/widgets/clock_widget.dart';
import 'package:flutter/material.dart';
    
class ClockPage extends StatelessWidget {

  const ClockPage({ Key? key }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Clock'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            Center(
              child: ClockWidget(
                time: ClockTimeModel(
                  hour: 12,
                  min: 38,
                  sec: 56,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}