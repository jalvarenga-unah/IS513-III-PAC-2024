import 'package:clone_whatsapp/src/modules/contacts/pages/fragments/chats_fragments.dart';
import 'package:clone_whatsapp/src/modules/contacts/pages/fragments/comunidades_fragment.dart';
import 'package:clone_whatsapp/src/modules/contacts/pages/fragments/estados_fragment.dart';
import 'package:clone_whatsapp/src/modules/contacts/pages/fragments/llamadas_fragment.dart';
import 'package:clone_whatsapp/src/modules/contacts/widgets/bottom_menu.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final pageViewController = PageController();

  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          'Clone Whatsapp',
          style: TextStyle(
            color: Colors.teal[600],
            fontSize: 24,
            fontWeight: FontWeight.w700,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.camera_alt_outlined),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ],
      ),
      body: PageView(
        controller: pageViewController,
        //⬇️ cancela el swipe de las paginas
        // physics: const NeverScrollableScrollPhysics(),
        children: const [
          ChatFragment(),
          EstadosFragment(),
          ComunidadesFragmnet(),
          LlamadasFragment()
        ],
        onPageChanged: (page) {
          currentPage = page;
          //tiene efecto en todo el arbol de widgets
          setState(() {});
        },
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.teal[600],
        child: const Icon(
          Icons.message_outlined,
          color: Colors.white,
        ),
      ),
      bottomNavigationBar: BottomMenu(
        currentIndex: currentPage,
        //callback para cambiar de pagina
        changePage: (index) {
          // pageViewController.animateToPage(index,
          //     duration: const Duration(milliseconds: 300),
          //     curve: Curves.easeIn);

          pageViewController.jumpToPage(index);
        },
      ),
    );
  }
}
