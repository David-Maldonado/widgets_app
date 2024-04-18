import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/theme/app_theme.dart';

//!notar los tipos de providers de riverpod

// un simple entero
final selectColorProvider = StateProvider<int>((ref) => 0);

// un simple boolean
final isDarkmodeProvider = StateProvider((ref) => true);

// Listado de colores inmutable
final colorListProvider = Provider((ref) => colorList);
