import 'package:clock_painter/components/card_component.dart';
import 'package:clock_painter/components/page_presentation_component.dart';
import 'package:clock_painter/pages/circle_examples/examples/circle_one_page.dart';
import 'package:clock_painter/pages/circle_examples/examples/circle_two_page.dart';
import 'package:flutter/material.dart';
    
class CircleExamplesPage extends StatelessWidget {

  const CircleExamplesPage({ Key? key }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return const PagePresentationComponent(
      title: "Circles", 
      cards: [
        CardComponent(
          label: "Exemplo 1", 
          page: CircleOnePage(),
        ),
        CardComponent(
          label: "Exemplo 2", 
          page: CircleTwoPage(),
        ),
      ],
    );
  }
}