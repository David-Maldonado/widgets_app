import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
      body: const _ButtonsView(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.arrow_back_ios_new_rounded),
        onPressed: () {
          context.pop();
        },
      ),
    );
  }
}

class _ButtonsView extends StatelessWidget {
  const _ButtonsView();

  //!Ejemplo de como devolver con un get el valor al label
  get label => const Text('Filled Icon');

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Wrap(
          spacing: 10,
          alignment: WrapAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {}, child: const Text('Eleveted Button')),
            const ElevatedButton(
                onPressed: null, child: Text('Eleveted Disabled')),
            ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.baby_changing_station),
                label: const Text('Eleveted Icon')),
            FilledButton(onPressed: () {}, child: const Text('Filled')),
            FilledButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.ac_unit_rounded),
                label: label),
            OutlinedButton(onPressed: () {}, child: const Text('Outline')),
            OutlinedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.terminal),
                label: const Text('Outline Icon')),
            TextButton(onPressed: () {}, child: const Text('Text Button')),
            TextButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.abc),
                label: const Text('Text Button Icon')),
            const CustomButton(),
            IconButton(onPressed: () {}, icon: const Icon(Icons.abc_sharp)),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.nat),
              style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(colors.primary),
                  iconColor: const MaterialStatePropertyAll(Colors.white)),
            )
          ],
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({super.key});

//!El widget ClipRRect nos ayuda a dar forma al botón
//!El Material a poder ir agregando propoedasdes de material
//!InkWell a darle interactividad
  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Material(
        color: colors.primary,
        child: InkWell(
          onTap: () {},
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              'Hola mundo',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
