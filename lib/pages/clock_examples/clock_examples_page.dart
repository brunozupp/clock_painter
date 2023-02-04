import 'package:clock_painter/components/card_component.dart';
import 'package:clock_painter/components/page_presentation_component.dart';
import 'package:clock_painter/pages/clock_examples/clock_one/clock_one_page.dart';
import 'package:clock_painter/pages/clock_examples/clock_two/clock_two_page.dart';
import 'package:flutter/material.dart';
    
class ClockExamplesPage extends StatelessWidget {

  const ClockExamplesPage({ Key? key }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return const PagePresentationComponent(
      title: "Clocks", 
      cards: [
        CardComponent(
          label: "Exemplo 1", 
          page: ClockOnePage(),
        ),
        CardComponent(
          label: "Exemplo 2", 
          page: ClockTwoPage(),
        ),
      ],
    );
  }
}