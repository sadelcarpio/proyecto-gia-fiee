import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:proyecto_gia_fiee/screens/navigation.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final List<CameraDescription> cameras = await availableCameras();
  runApp(VisionApp(cameras: cameras));
}

class VisionApp extends StatelessWidget {
  final List<CameraDescription> cameras;
  const VisionApp({Key? key, required this.cameras}) : super(key: key);
  @override
  // método build, retorna un widget
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TabBar Demo',
      home: NavigationPage(cameras: cameras),
      debugShowCheckedModeBanner: false,
    );
  }
}
