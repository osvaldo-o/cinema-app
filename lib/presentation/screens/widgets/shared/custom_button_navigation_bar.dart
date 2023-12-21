import 'package:flutter/material.dart';

class CustomButtomNavigationBar extends StatelessWidget {
  const CustomButtomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(elevation: 0, items: const [
      BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: 'Inicio'),
      BottomNavigationBarItem(
          icon: Icon(Icons.label_important_outline), label: 'Categorias'),
      BottomNavigationBarItem(
          icon: Icon(Icons.favorite_outline), label: 'Favoritos'),
    ]);
  }
}
