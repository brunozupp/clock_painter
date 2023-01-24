import 'package:flutter/material.dart';

import 'package:clock_painter/components/card_component.dart';
   
class PagePresentationComponent extends StatelessWidget {

  final String title;
  final List<CardComponent> cards;

  const PagePresentationComponent({
    Key? key,
    required this.title,
    required this.cards,
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: cards.map((e) {
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
}
