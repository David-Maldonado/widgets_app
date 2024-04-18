import 'package:flutter/material.dart';
import 'package:widgets_app/config/menu/menu_item.dart';
import 'package:widgets_app/presentation/screens/cards/cards_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/presentation/widgets/side_menu.dart';

class HomeScreen extends StatelessWidget {
  //!se define un nombre para cada pantalla para usar con goRoute.
  static const String name = 'home_screen';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
        //!el scaffoldKey tiene el estado actual del scaffold, si tiene el draw o no abierto, si tiene menu
        //!tiene la referencia de lo que pasa en el
        key: scaffoldKey,
        appBar: AppBar(
          title: const Text('Flutter + Material 3'),
        ),
        body: const _HomeView(),
        drawer: SideMenu(scaffoldKey: scaffoldKey));
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
        //? se listan las formas de usar, por nombre, link
        // context.pushNamed(CardsScreen.name);
        context.push(menuItem.link);

        //!El context es el arbol de widgets
        //!el push sobrepone una pantalla sobre otra y el pop vuelve a la anterior
        //?Es una de las formas de 'navegar en flutter'
        // Navigator.of(context).push(
        //     MaterialPageRoute(builder: (context) => const ButtonsScreen()));

        //? la siguiente config es con nombre de ruta, no es recomendable pero hay que conocer
        // Navigator.pushNamed(context, menuItem.link);
      },
      //?El splashColor es para darle color cuando se pasa el cursor sobre el listTile
      //splashColor: colors.primary,
    );
  }
}
