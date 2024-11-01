import 'package:clone_whatsapp/src/modules/contacts/models/chat_arguments.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    final argumentos =
        ModalRoute.of(context)!.settings.arguments as ChatArguments;

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(argumentos.userName),
      ),
      body: Center(child: Text('Id ${argumentos.chatId}')),
    );
  }
}
