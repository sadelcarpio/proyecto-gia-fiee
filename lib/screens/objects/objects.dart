import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

// Jean
class ObjectsRecognitionPage extends StatefulWidget {
  final List<CameraDescription> cameras;
  const ObjectsRecognitionPage({Key? key, required this.cameras})
      : super(key: key);

  @override
  State<ObjectsRecognitionPage> createState() => _ObjectsRecognitionPageState();
}

class _ObjectsRecognitionPageState extends State<ObjectsRecognitionPage> {
  late CameraController cameraController;
  late Future<void> initializeControllerFuture;
  @override
  void initState() {
    super.initState();
    cameraController =
        CameraController(widget.cameras[1], ResolutionPreset.medium);
    initializeControllerFuture = cameraController.initialize();
  }

  @override
  void dispose() {
    cameraController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: FutureBuilder<void>(
            future: initializeControllerFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return CameraPreview(cameraController);
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ),
      ],
    );
  }
}
