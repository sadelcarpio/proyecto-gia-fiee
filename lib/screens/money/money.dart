import 'package:flutter/material.dart';

// Nicolas
class MoneyRecognitionPage extends StatelessWidget {
  const MoneyRecognitionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Dinero',
        style: TextStyle(
            color: Colors.white, fontSize: 36.0, fontWeight: FontWeight.bold),
      ),
    );
  }
}
