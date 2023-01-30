import 'package:clock_painter/pages/clock_one/ui/clock_one_styles.dart';
import 'package:clock_painter/pages/clock_one/utils/clock_one_time_model.dart';
import 'package:clock_painter/pages/clock_one/widgets/clock_one_widget.dart';
import 'package:flutter/material.dart';
import 'package:timer_builder/timer_builder.dart';
    
class ClockOnePage extends StatelessWidget {

  const ClockOnePage({ Key? key }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Clock'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              TimerBuilder.periodic(
                const Duration(seconds: 1), 
                builder: (context) {
                  
                  final date = DateTime.now();

                  final seconds = date.second.toString().padLeft(2,"0");
                  final minutes = date.minute.toString().padLeft(2,"0");
                  final hours = date.hour.toString().padLeft(2,"0");

                  return Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Today",
                            style: ClockOneStyle.mainTextThin,
                          ),
                          Text(
                            "$hours:$minutes:$seconds",
                            style: ClockOneStyle.mainText,
                          ),
                        ],
                      ),
                      Center(
                        child: ClockOneWidget(
                          time: ClockOneTimeModel(
                            hour: date.hour,
                            min: date.minute,
                            sec: date.second,
                          ),
                        ),
                      ),
                    ],
                  );
                }
              ),

              const SizedBox(
                height: 60,
              ),

              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Select another Time Zone",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),

                  Divider(
                    color: Colors.black45,
                  ),
                ],
              ),

              ListView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: ClockOneStyle.primaryColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Bei jin",
                              style: ClockOneStyle.mainTextWhite,
                            ),
                            Text(
                              "${DateTime.now().hour}:${DateTime.now().minute}",
                              style: ClockOneStyle.mainTextWhite,
                            ),
                          ],
                        ),

                        const SizedBox(
                          height: 8,
                        ),

                        const Text(
                          "Today",
                          style: ClockOneStyle.mainTextThinWhite,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}