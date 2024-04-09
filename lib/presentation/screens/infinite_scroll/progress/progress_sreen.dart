import 'package:flutter/material.dart';

class ProgressScreen extends StatelessWidget {
  const ProgressScreen({super.key});

  static const name = 'progress_screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Progress Indicator'),
      ),
      body: const _ProgressView(),
    );
  }
}

class _ProgressView extends StatelessWidget {
  const _ProgressView();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        children: [
          SizedBox(height: 30),
          Text('Circular porgress indicator'),
          SizedBox(height: 30),
          CircularProgressIndicator(
            strokeWidth: 2,
            backgroundColor: Colors.black26,
          ),
          SizedBox(height: 30),
          Text('Circular y linear porgress indicator controlado'),
          SizedBox(height: 30),
          _ControlledProgressIndicatorControlado()
        ],
      ),
    );
  }
}

class _ControlledProgressIndicatorControlado extends StatelessWidget {
  const _ControlledProgressIndicatorControlado();

  @override
  Widget build(BuildContext context) {
    //!El stremBuilder se contruye en tiempo de ejecución
    return StreamBuilder<double>(
        //!flujo de información es un strem
        stream: Stream.periodic(const Duration(milliseconds: 100),
                (emittedValue) => (emittedValue / 100) // 0.0 - 1.0

                )
            .takeWhile(
                (formattedEmittedValue) => (formattedEmittedValue < 1.01)),
        builder: (context, snapshot) {
          final progressValue = snapshot.data ?? 0.0;

          print(progressValue);
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(
                  value: progressValue,
                  strokeWidth: 2,
                  backgroundColor: Colors.black26,
                ),
                const SizedBox(width: 20),
                Expanded(
                    child: LinearProgressIndicator(
                  value: progressValue,
                ))
              ],
            ),
          );
        });
  }
}
