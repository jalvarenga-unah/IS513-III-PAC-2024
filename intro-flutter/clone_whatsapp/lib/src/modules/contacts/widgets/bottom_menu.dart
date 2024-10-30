import 'package:flutter/material.dart';

class BottomMenu extends StatefulWidget {
  BottomMenu({
    super.key,
    required this.changePage,
    required this.currentIndex,
  });

  final void Function(int) changePage;
  int currentIndex;

  @override
  State<BottomMenu> createState() => _BottomMenuState();
}

class _BottomMenuState extends State<BottomMenu> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType
          .fixed, // Propiedad para que se muestren todos los iconos cuando son mas de 3
      currentIndex: widget.currentIndex,
      onTap: (index) {
        widget.currentIndex = index;
        // pageViewController = index;
        widget.changePage(widget.currentIndex); // se ejecuta la función
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
