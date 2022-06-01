import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyecto_gia_fiee/providers/cameraProvider.dart';

// Jean
class ObjectsRecognitionPage extends StatefulWidget {
  const ObjectsRecognitionPage({Key? key}) : super(key: key);

  @override
  State<ObjectsRecognitionPage> createState() => _ObjectsRecognitionPageState();
}

class _ObjectsRecognitionPageState extends State<ObjectsRecognitionPage> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Objetos',
        style: TextStyle(
            color: Colors.white, fontSize: 36.0, fontWeight: FontWeight.bold),
      ),
    );
  }
}
