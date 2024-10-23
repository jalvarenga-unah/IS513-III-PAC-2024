import 'package:clone_whatsapp/src/modules/contacts/widgets/item_chat.dart';
import 'package:flutter/material.dart';
import 'package:clone_whatsapp/src/api/store/data_chats.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    print(chats); //La respuesta del servidor
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
      body: Center(
          child: ListView.builder(
        itemCount: 10,
        itemBuilder: (BuildContext context, int indice) {
          return Itemchat(
            sender: 'Juanito',
            message: 'olii',
            time: '10:00',
          );
        },
      )),
    );
  }
}
