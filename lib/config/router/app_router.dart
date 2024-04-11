import 'package:go_router/go_router.dart';
import 'package:widgets_app/presentation/screens/screens.dart';

final router = GoRouter(

    //!se puede o no definir la ruta inicial, pero resulta interesante cuando trabajas sobre un widget que queres ir observando inicialmente

    initialLocation: '/',
    routes: [
      GoRoute(
          path: '/',
          builder: (context, state) => const HomeScreen(),
          name: HomeScreen.name),
      GoRoute(
          path: '/cards',
          builder: (context, state) => const CardsScreen(),
          name: CardsScreen.name),
      GoRoute(
          path: '/buttons',
          builder: (context, state) => const ButtonsScreen(),
          name: ButtonsScreen.name),
      GoRoute(
          path: '/progress',
          builder: (context, state) => const ProgressScreen(),
          name: ProgressScreen.name),
      GoRoute(
          path: '/snackbars',
          builder: (context, state) => const SnackBarScreen(),
          name: SnackBarScreen.name),
      GoRoute(
          path: '/animated',
          builder: (context, state) => const AnimatedScreen(),
          name: AnimatedScreen.name),
      GoRoute(
          path: '/ui-controls',
          builder: (context, state) => const UiControlScreen(),
          name: UiControlScreen.name),
      GoRoute(
          path: '/tutorial',
          builder: (context, state) => const AppTutorialScreen(),
          name: AppTutorialScreen.name),
    ]);
