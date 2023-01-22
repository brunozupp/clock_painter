import 'package:flutter/material.dart';
   
class CardComponent extends StatelessWidget {

  final String label;
  final Widget page;

  const CardComponent({
    Key? key,
    required this.label,
    required this.page,
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (_) => page),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.grey.shade200,
        ),
        child: Text(
          label,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.black,
          ),
        )
      ),
    );
  }
}
