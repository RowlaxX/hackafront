import 'dart:math';

import 'package:flutter/material.dart';

class ProfileCard extends StatelessWidget {
  final String id;
  final void Function(String) onTap;

  const ProfileCard(this.id, this.onTap, {super.key});

  @override
  Widget build(BuildContext context) => Expanded(child: Padding(
    padding: const EdgeInsets.all(10), 
    child: GestureDetector(
      onTap: () => onTap(id),
      child: Container(
        height: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: color.withAlpha(max(0, color.alpha - 80)),
        ),
        child: Row(
          children: [
            Icon(Icons.account_circle_sharp, color: color, size: 70),
            const Padding(padding: EdgeInsets.symmetric(horizontal: 5)),
            Text(id, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold))
          ],
        ),
      )),
    ),
  );
  
  
  
  Color get color {
    var rand = Random(id.hashCode);
    var r = 32 + rand.nextInt(192);
    var g = 32 + rand.nextInt(192);
    var b = 32 + rand.nextInt(192);
    return Color.fromARGB(255, r, g, b);
  }
}