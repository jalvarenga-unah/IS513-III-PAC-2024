import 'package:clone_whatsapp/main.dart';
import 'package:clone_whatsapp/src/modules/contacts/models/chat_arguments.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    //TODO: manejar los argumentos y mostrarlos en la pantalla
    // final argumentos =
    //     ModalRoute.of(context)!.settings.arguments as ChatArguments;
    final id = GoRouterState.of(context).pathParameters['chatId'];

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text('argumentos.userName'),
      ),
      body: Center(child: Text('$id ')),
    );
  }
}
