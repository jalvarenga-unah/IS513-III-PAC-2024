import 'package:clone_whatsapp/src/api/store/data_chats.dart';
import 'package:clone_whatsapp/src/modules/contacts/widgets/item_chat.dart';
import 'package:flutter/material.dart';

class ChatFragment extends StatelessWidget {
  const ChatFragment({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    print('Iniciando chat fragment');
    return Center(
      child: ListView.builder(
        itemCount: chats.length,
        itemBuilder: (BuildContext context, int indice) {
          return Itemchat(
            sender: chats[indice]['sender']!,
            id: chats[indice]['id']!,
            message: chats[indice]['message']!,
            time: chats[indice]['time']!,
          );
        },
      ),
    );
  }
}
