import 'package:flutter/material.dart';
import 'package:proyecto_gia_fiee/screens/navigation.dart';

void main() {
  runApp(const VisionApp());
}
class VisionApp extends StatelessWidget {
  const VisionApp({Key? key}) : super(key: key);
  @override
  // método build, retorna un widget
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'TabBar Demo',
      home: NavigationPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}