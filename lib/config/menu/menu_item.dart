import 'package:flutter/material.dart';

class MenuItem {
  final String title;
  final String subTitle;
  final String link;
  final IconData icon;

  const MenuItem(
      {required this.title,
      required this.subTitle,
      required this.link,
      required this.icon});
}

const appMenuItem = <MenuItem>[
  MenuItem(
      title: 'Botones',
      subTitle: 'Varios botones en Flutter',
      link: '/buttons',
      icon: Icons.smart_button_outlined),
  MenuItem(
      title: 'Tarjetas',
      subTitle: 'Un contenedor estilizado',
      link: '/cards',
      icon: Icons.credit_card),
  MenuItem(
      title: 'ProgressIndicators',
      subTitle: 'Generales y controlados',
      link: '/progress',
      icon: Icons.refresh_rounded),
  MenuItem(
      title: 'Snackbars',
      subTitle: 'Snackbars',
      link: '/snackbars',
      icon: Icons.drag_indicator),
  MenuItem(
      title: 'Animated container',
      subTitle: 'Stateful widget animado',
      link: '/animated',
      icon: Icons.check_box_outlined),
  MenuItem(
      title: 'UI Controls + Titles',
      subTitle: 'Serie de controles de Flutter',
      link: '/ui-controls',
      icon: Icons.smart_button_outlined),
  MenuItem(
      title: 'Introducción a la app',
      subTitle: 'Tutorial introductorio',
      link: '/tutorial',
      icon: Icons.app_settings_alt_outlined),
  MenuItem(
      title: 'InfiteScroll y Pull',
      subTitle: 'Listas infinitas y pull to refesh',
      link: '/inifite-scroll',
      icon: Icons.remove_from_queue_sharp),
  MenuItem(
      title: 'Counter',
      subTitle: 'Contador de números simple',
      link: '/counter',
      icon: Icons.numbers),
  MenuItem(
      title: 'Theme changer',
      subTitle: 'Cambiar tema de la app',
      link: '/theme-changer',
      icon: Icons.color_lens_outlined),
];
