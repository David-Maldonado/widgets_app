import 'package:flutter/material.dart';
import 'package:widgets_app/config/router/app_router.dart';
import 'package:widgets_app/config/theme/app_theme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/presentation/providers/theme_provider.dart';

void main() {
  //!riverpod sabrá donde buscar cada uno de nuestros providers que vayamos creando
  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool isDarkMode = ref.watch(isDarkmodeProvider);
    final int selectColorIndex = ref.watch(selectColorProvider);

    return MaterialApp.router(
      title: 'Flutter Widgets',
      routerConfig: router,
      debugShowCheckedModeBanner: false,
      theme: AppTheme(selectedColor: selectColorIndex, isDarkMode: isDarkMode)
          .getTheme(),

      //!lo comentado es una forma de configurar rutas, comentado anteriormente
      //!pero lo recomendable es usar go_route
      // routes: {
      //   '/buttons': (context) => const ButtonsScreen(),
      //   '/cards': (context) => const CardsScreen()
      // },
    );
  }
}
