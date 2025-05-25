import 'package:flutter/material.dart';
import 'screens/bienvenida_screen.dart'; 

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false, //oculta la cinta de debug
      home: BienvenidaScreen(), //vinculacion de la pantala de bienvenida
    );
  }
}
