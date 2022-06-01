import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyecto_gia_fiee/providers/camera_provider.dart';
import 'package:proyecto_gia_fiee/screens/navigation.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final List<CameraDescription> cameras = await availableCameras();
  final CameraDescription camera = cameras.first;
  runApp(VisionApp(camera: camera));
}

class VisionApp extends StatelessWidget {
  final CameraDescription camera;
  const VisionApp({Key? key, required this.camera}) : super(key: key);
  @override
  // método build, retorna un widget
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CameraProvider>(
      create: (_) => CameraProvider(camera: camera),
      child: const MaterialApp(
        title: 'TabBar Demo',
        home: NavigationPage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
