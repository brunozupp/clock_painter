import 'package:clock_painter/components/card_component.dart';
import 'package:clock_painter/components/page_presentation_component.dart';
import 'package:clock_painter/pages/polygon_examples/examples/polygon_example_one_page.dart';
import 'package:flutter/material.dart';
    
class PolygonExamplesPage extends StatelessWidget {

  const PolygonExamplesPage({ Key? key }) : super(key: key);
  
    @override
  Widget build(BuildContext context) {
    return const PagePresentationComponent(
      title: "Polygons", 
      cards: [
        CardComponent(
          label: "Exemplo 1", 
          page: PolygonExampleOnePage(),
        ),
      ],
    );
  }
}