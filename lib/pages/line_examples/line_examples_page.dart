import 'package:clock_painter/components/card_component.dart';
import 'package:clock_painter/components/page_presentation_component.dart';
import 'package:clock_painter/pages/line_examples/examples/line_example_five_page.dart';
import 'package:clock_painter/pages/line_examples/examples/line_example_four_page.dart';
import 'package:clock_painter/pages/line_examples/examples/line_example_one_page.dart';
import 'package:clock_painter/pages/line_examples/examples/line_example_six_page.dart';
import 'package:clock_painter/pages/line_examples/examples/line_example_three_page.dart';
import 'package:clock_painter/pages/line_examples/examples/line_example_two_page.dart';
import 'package:flutter/material.dart';
    
class LineExamplesPage extends StatelessWidget {

  const LineExamplesPage({ Key? key }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return const PagePresentationComponent(
      title: "Lines", 
      cards: [
        CardComponent(
          label: "Exemplo 1", 
          page: LineExampleOnePage(),
        ),
        CardComponent(
          label: "Exemplo 2", 
          page: LineExampleTwoPage(),
        ),
        CardComponent(
          label: "Exemplo 3", 
          page: LineExampleThreePage(),
        ),
        CardComponent(
          label: "Exemplo 4", 
          page: LineExampleFourPage(),
        ),
        CardComponent(
          label: "Exemplo 5", 
          page: LineExampleFivePage(),
        ),
        CardComponent(
          label: "Exemplo 6", 
          page: LineExampleSixPage(),
        ),
      ],
    );
  }
}