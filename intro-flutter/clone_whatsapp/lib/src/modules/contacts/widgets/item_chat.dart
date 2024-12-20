import 'package:clone_whatsapp/src/modules/contacts/models/chat_arguments.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Itemchat extends StatelessWidget {
  const Itemchat({
    super.key,
    required this.sender,
    required this.message,
    required this.time,
    required this.id,
  });

  final String sender;
  final String message;
  final String time;
  final int id;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(sender),
      subtitle: Text(message),
      leading: CircleAvatar(
          backgroundColor: Colors.teal[100],
          child: Text(sender[0])), //TODO: agregar una imagen si la tiene
      trailing: Column(
        children: [
          Text(time),
          const CircleAvatar(
            radius: 14,
            child: Text(
              '1',
              style: TextStyle(fontSize: 10),
            ),
          ),
        ],
      ),
      onTap: () {
        //? Ejemplos de como hacer navegación
        // Navigator.of(context).pushNamed('/chat');
        // Navigator.of(context).pushNamed('/home');
        // Navigator.of(context).pushReplacementNamed('/home');
        // Navigator.of(context).popAndPushNamed(
        //   '/home',
        // );
        // Navigator.of(context)
        //     .push(MaterialPageRoute(builder: (context) => ChatPage()));

        // context.go('/home/chat',
        //     extra: ChatArguments(chatId: id, userName: sender));

        context.goNamed('chat', pathParameters: {
          'chatId': id.toString(),
        }); // -> /chat

        // Navigator.pushNamed(context, '/chat',
        //     arguments: ChatArguments(chatId: id, userName: sender));
      },
    );
  }
}
