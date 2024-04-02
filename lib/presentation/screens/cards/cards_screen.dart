import 'package:flutter/material.dart';

class CardsScreen extends StatelessWidget {
  //!se define un nombre para cada pantalla para usar con goRoute.
  //?es static porque no quiero crear una instancia de la clase para usar solo el nombre.
  static const String name = 'cards_screen';
  const CardsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cards Screen'),
      ),
      body: const Placeholder(),
    );
  }
}


//!screens o pantallas, no son porque básicamente tienen un scaffold