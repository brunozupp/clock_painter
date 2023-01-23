import 'package:clock_painter/components/card_component.dart';
import 'package:clock_painter/pages/line_examples/examples/line_example_one_page.dart';
import 'package:clock_painter/pages/line_examples/examples/line_example_three_page.dart';
import 'package:clock_painter/pages/line_examples/examples/line_example_two_page.dart';
import 'package:flutter/material.dart';
    
class LineExamplesPage extends StatelessWidget {

  const LineExamplesPage({ Key? key }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lines'),
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
    ];
  }
}