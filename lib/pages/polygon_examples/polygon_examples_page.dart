import 'package:clock_painter/components/card_component.dart';
import 'package:clock_painter/pages/polygon_examples/examples/polygon_example_one_page.dart';
import 'package:flutter/material.dart';
    
class PolygonExamplesPage extends StatelessWidget {

  const PolygonExamplesPage({ Key? key }) : super(key: key);
  
    @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Polygons'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: _buildCardsPage().map((e) {
            return Padding(
              padding: const EdgeInsets.only(
                bottom: 16,
              ),
              child: e,
            );
          }).toList(),
        ),
      ),
    );
  }

  List<Widget> _buildCardsPage() {
    return const [
      CardComponent(
        label: "Exemplo 1", 
        page: PolygonExampleOnePage(),
      ),
    ];
  }
}