import 'package:clock_painter/components/card_component.dart';
import 'package:clock_painter/components/page_presentation_component.dart';
import 'package:clock_painter/pages/line_examples/examples/line_five_page.dart';
import 'package:clock_painter/pages/line_examples/examples/line_four_page.dart';
import 'package:clock_painter/pages/line_examples/examples/line_one_page.dart';
import 'package:clock_painter/pages/line_examples/examples/line_six_page.dart';
import 'package:clock_painter/pages/line_examples/examples/line_three_page.dart';
import 'package:clock_painter/pages/line_examples/examples/line_two_page.dart';
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
          page: LineOnePage(),
        ),
        CardComponent(
          label: "Exemplo 2", 
          page: LineTwoPage(),
        ),
        CardComponent(
          label: "Exemplo 3", 
          page: LineThreePage(),
        ),
        CardComponent(
          label: "Exemplo 4", 
          page: LineFourPage(),
        ),
        CardComponent(
          label: "Exemplo 5", 
          page: LineFivePage(),
        ),
        CardComponent(
          label: "Exemplo 6", 
          page: LineSixPage(),
        ),
      ],
    );
  }
}