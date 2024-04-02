import 'package:flutter/material.dart';

class ButtonsScreen extends StatelessWidget {
  //!se define un nombre para cada pantalla para usar con goRoute.
  static const String name = 'buttons_screen';
  //?es static porque no quiero crear una instancia de la clase para usar solo el nombre.

  const ButtonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buttons Screen'),
      ),
      body: const Placeholder(),
    );
  }
}
