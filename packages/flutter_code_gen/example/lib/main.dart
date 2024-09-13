import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_code_gen_example/gen/icon_font.gen.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Icon IcoMoon")),
        body: GridView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 6),
          children: IcoMoons.values.map((e) => _getItem(e)).toList(),
        ),
      ),
    );
  }

  Widget _getItem(IconData icon) => Center(
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors
                .primaries[Random().nextInt(Colors.primaries.length)].shade200,
          ),
          child: Icon(icon),
        ),
      );
}
