import 'package:flutter/material.dart';

// David
class PersonRecognitionPage extends StatelessWidget {
  const PersonRecognitionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Personas',
        style: TextStyle(
            color: Colors.white, fontSize: 36.0, fontWeight: FontWeight.bold),
      ),
    );
  }
}
