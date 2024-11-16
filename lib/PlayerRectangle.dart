import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Playerrectangle extends StatefulWidget {
  const Playerrectangle({super.key});

  @override
  State<Playerrectangle> createState() => _PlayerrectangleState();
}

class _PlayerrectangleState extends State<Playerrectangle> {
  @override
  Widget build(BuildContext context) {
    return const Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center, // Centra le icone orizzontalmente
        children: [
          Icon(Icons.home),
          SizedBox(width: 10), // Aggiunge uno spazio tra le icone
          Icon(Icons.search),
          SizedBox(width: 10),
          Icon(Icons.settings),
        ],
      ),
    );
  }
}
