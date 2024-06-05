import 'package:flutter/material.dart';

class ButtonCounter extends StatelessWidget {
  ButtonCounter({super.key, required this.function, required this.icon});

  Function function;
  Icon icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        color: Colors.orange,
        child: IconButton(
            onPressed: () {
              function();
            },
            icon: icon),
      ),
    );
  }
}
