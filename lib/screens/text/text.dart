import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyecto_gia_fiee/providers/cameraProvider.dart';

// Jean
class TextRecognitionPage extends StatefulWidget {
  const TextRecognitionPage({Key? key}) : super(key: key);

  @override
  State<TextRecognitionPage> createState() => _ObjectsRecognitionPageState();
}

class _ObjectsRecognitionPageState extends State<TextRecognitionPage> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Texto',
        style: TextStyle(
            color: Colors.white, fontSize: 36.0, fontWeight: FontWeight.bold),
      ),
    );
  }
}
