import 'package:widgets_app/config/menu/menu_item.dart';
import 'package:widgets_app/presentation/screens/screens.dart';
import 'package:go_router/go_router.dart';

class SideMenu extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const SideMenu({super.key, required this.scaffoldKey});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  int navDrawerIndex = 0;
  @override
  Widget build(BuildContext context) {
    //!espacios vacios o no utilizables, en este caso arriba por la camara u otros que puedan estorbar por marca de cel
    final hastNotch = MediaQuery.of(context).viewPadding.top > 35;

    return NavigationDrawer(
        selectedIndex: navDrawerIndex,
        onDestinationSelected: (value) {
          setState(() {
            navDrawerIndex = value;
          });
          final menuItem = appMenuItem[value];
          context.push(menuItem.link);

          //!si queremos acceder a las propiedades de un statefullwidget
          //!aquí hacemos que se cierre el draw una vez que nos dirigamos a la ruta
          widget.scaffoldKey.currentState?.closeDrawer();
        },
        children: [
          Padding(
              padding: EdgeInsets.fromLTRB(28, hastNotch ? 0 : 20, 16, 10),
              child: const Text('Principales')),

          //!mostrar los primeros 3
          ...appMenuItem.sublist(0, 3).map((item) =>
              NavigationDrawerDestination(
                  icon: Icon(item.icon), label: Text(item.title))),
          const Padding(
            padding: EdgeInsets.fromLTRB(28, 16, 28, 10),
            child: Divider(),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(28, 10, 16, 10),
            child: Text('Más opciones'),
          ),

          ...appMenuItem.sublist(3).map((item) => NavigationDrawerDestination(
              icon: Icon(item.icon), label: Text(item.title))),
        ]);
  }
}
