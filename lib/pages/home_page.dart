import 'package:clock_painter/components/card_component.dart';
import 'package:clock_painter/pages/circle_examples/circle_examples_page.dart';
import 'package:clock_painter/pages/line_examples/line_examples_page.dart';
import 'package:clock_painter/pages/polygon_examples/polygon_examples_page.dart';
import 'package:flutter/material.dart';
    
class HomePage extends StatelessWidget {

  const HomePage({ Key? key }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Projeto CustomPaint'),
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
        label: "Lines", 
        page: LineExamplesPage(),
      ),
      CardComponent(
        label: "Circle", 
        page: CircleExamplesPage(),
      ),
      CardComponent(
        label: "Polygon", 
        page: PolygonExamplesPage(),
      ),
    ];
  }
}