import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class CameraProvider with ChangeNotifier {
  CameraProvider({required CameraDescription camera}) : _camera = camera;
  final CameraDescription _camera;
  CameraDescription get camera => _camera;
}
