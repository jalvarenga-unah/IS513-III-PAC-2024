import 'package:flutter/material.dart';

class BottomMenu extends StatefulWidget {
  const BottomMenu({super.key, required this.changePage});

  final void Function(int) changePage;

  @override
  State<BottomMenu> createState() => _BottomMenuState();
}

class _BottomMenuState extends State<BottomMenu> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType
          .fixed, // Propiedad para que se muestren todos los iconos cuando son mas de 3
      currentIndex: currentIndex,
      onTap: (index) {
        currentIndex = index;
        // pageViewController = index;
        widget.changePage(currentIndex); // se ejecuta la función
        setState(() {});
      },
      selectedItemColor: Colors.teal[600],
      items: const [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.chat_outlined,
          ),
          label: 'Chats',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.fiber_new_sharp,
          ),
          label: 'Estados',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.people_outline,
          ),
          label: 'Comunidades',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.call_outlined,
          ),
          label: 'llamadas',
        ),
      ],
    );
  }
}
