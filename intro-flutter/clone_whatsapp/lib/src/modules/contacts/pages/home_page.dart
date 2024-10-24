import 'package:clone_whatsapp/src/modules/contacts/widgets/bottom_menu.dart';
import 'package:clone_whatsapp/src/modules/contacts/widgets/item_chat.dart';
import 'package:flutter/material.dart';
import 'package:clone_whatsapp/src/api/store/data_chats.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
        children: const [
          chat_fragment(),
          estados_fragment(),
          llamadas_fragment()
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.teal[600],
        child: const Icon(
          Icons.message_outlined,
          color: Colors.white,
        ),
      ),
      bottomNavigationBar: BottomMenu(),
    );
  }
}

class llamadas_fragment extends StatelessWidget {
  const llamadas_fragment({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
    );
  }
}

class estados_fragment extends StatelessWidget {
  const estados_fragment({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
    );
  }
}

class chat_fragment extends StatelessWidget {
  const chat_fragment({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView.builder(
        itemCount: chats.length,
        itemBuilder: (BuildContext context, int indice) {
          return Itemchat(
            sender: chats[indice]['sender']!,
            message: chats[indice]['message']!,
            time: chats[indice]['time']!,
          );
        },
      ),
    );
  }
}
