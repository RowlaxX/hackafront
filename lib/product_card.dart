import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String name;
  final int chance;

  const ProductCard(this.name, this.chance, {super.key});

  Color getColorFromValue(num value) {
    if (value <= 50) {
      return Color.fromARGB(255, 255, ((value / 50) * 255).toInt(), 0);
    }
    else {
      return Color.fromARGB(255, (255 - ((value - 50) / 50) * 255).toInt(), 255, 0);
    }
  }

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.all(5),
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: getColorFromValue(chance)
      ),
      height: 140,
      width: 250,
      child: Center(child: Column(
        children: [
          Text(name, style: const TextStyle(fontSize: 16)),
          Text('$chance%', style: const TextStyle(fontSize: 18))
        ],
      )),
    ),
  );

}

