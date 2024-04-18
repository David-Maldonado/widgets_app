import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/presentation/providers/theme_provider.dart';
import 'package:widgets_app/presentation/providers/counter_provider.dart';

class CounterScreen extends ConsumerWidget {
  static const name = 'counter_screen';

  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //!se queda observando el counterProvider
    final int clickCounter = ref.watch(counterProvider);
    final bool isDarkMode = ref.watch(isDarkmodeProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter Screen River'),
        actions: [
          IconButton(
            icon: Icon(isDarkMode
                ? Icons.dark_mode_outlined
                : Icons.light_mode_outlined),
            onPressed: () {
              ref
                  .read(isDarkmodeProvider.notifier)
                  .update((isDarkMode) => !isDarkMode);
            },
          )
        ],
      ),
      body: Center(
        child: Text('Valor: $clickCounter'),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.plus_one),
        onPressed: () {
          //no usar watch en métodos
          ref.read(counterProvider.notifier).state++;
        },
      ),
    );
  }
}
