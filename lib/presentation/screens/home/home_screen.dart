import 'package:flutter/material.dart';
import 'package:widgets_app/config/menu/menu_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter + Material 3'),
      ),
      body: const _HomeView(),
    );
  }
}
//!el key es si se va a usar el widget en otro lugar, a _HomeView le quitamos porque
//!es privad y será sólo aquí la única referencia

//! cuando vemos la palabra builder hay que entender que se va a construir
//! en tiempo de ejecución

class _HomeView extends StatelessWidget {
  const _HomeView();

  @override
  Widget build(BuildContext context) {
//! cuando el lenght puede ir cambiando podemos usar un gestor de estado
    return ListView.builder(
        itemCount: appMenuItem.length,
        itemBuilder: (context, index) {
          final menuItem = appMenuItem[index];
          return _CustomListTile(menuItem: menuItem);
        });
  }
}

class _CustomListTile extends StatelessWidget {
  const _CustomListTile({
    required this.menuItem,
  });

  final MenuItem menuItem;

  @override
  Widget build(BuildContext context) {
    //!usamos el theme definido anteriormete
    final colors = Theme.of(context).colorScheme;

    return ListTile(
      //!leading es icon o widget que colocamos delante del otro widget
      leading: Icon(
        menuItem.icon,
        //!primary es el color primario que definimos como tema del proyecto en el main
        color: colors.primary,
      ),
      title: Text(menuItem.title),
      subtitle: Text(menuItem.subTitle),
      //!trailing es icon o widget que colocamos al final del otro widget
      trailing: Icon(
        Icons.arrow_forward_ios_rounded,
        color: colors.primary,
      ),
      onTap: () {
        //TODO: navegar a otro pantalla.
      },
      //?El splashColor es para darle color cuando se pasa el cursor sobre el listTile
      //splashColor: colors.primary,
    );
  }
}
