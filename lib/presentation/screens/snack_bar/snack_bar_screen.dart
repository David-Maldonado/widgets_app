import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackBarScreen extends StatelessWidget {
  const SnackBarScreen({super.key});

  void openDialog(BuildContext context) {
    //!NO OLVIDAR QUE CUANDO SE VEA LA PALABRA BILDER SIGNIFICA QUE SE VA A CONSTRUIR EN TIEMPO DE EJECUCIÓN

    showDialog(
      context: context,
      //!para evitar que se cierre si no se da clic sobre las opciones actions o se da clic fuera del dialog
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text('Estás seguro?'),
        content: const Text(
            'Ipsum et laboris id anim laborum incididunt anim duis qui sint quis.'),
        actions: [
          TextButton(
              onPressed: () => context.pop(), child: const Text('Cancelar')),
          FilledButton(
              onPressed: () => context.pop(), child: const Text('Aceptar'))
        ],
      ),
    );
  }

  void showCustomSnackBar(BuildContext context) {
    //!usando el tema
    final colors = Theme.of(context).colorScheme;
    //! limpia los llamados anteriores para evitar que se llamane varias veces
    ScaffoldMessenger.of(context).clearSnackBars();

    final snackbar = SnackBar(
      content: const Text('Hola snackbar...!!!'),
      action: SnackBarAction(label: 'Ok', onPressed: () {}),
      duration: const Duration(seconds: 2),
      backgroundColor: colors.primary,
    );

    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  static const name = 'snack_bar_screen';
  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Snackbrs y Diálogos'),
      ),
      body: Center(
          child: Column(
        //!alinea el contenido de la columna en el centro verticalmente, claro, al ser columna
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FilledButton(
              onPressed: () {
                //!para mostrar las licencias usadas
                showAboutDialog(context: context, children: [
                  const Text(
                      'Do et ex eu ut veniam et pariatur cupidatat ullamco aliqua id tempor eiusmod et.')
                ]);
              },
              child: const Text('Licencias usadas')),
          FilledButton(
              onPressed: () => openDialog(context),
              child: const Text('Mostrar diálogo')),
        ],
      )),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => showCustomSnackBar(context),
        label: const Text('Mostrar Snackbar'),
        icon: const Icon(Icons.remove_red_eye_outlined),
        backgroundColor: colors.primary,
      ),
    );
  }
}
