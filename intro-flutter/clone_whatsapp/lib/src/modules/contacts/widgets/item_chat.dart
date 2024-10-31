import 'package:clone_whatsapp/src/modules/contacts/pages/chat_page.dart';
import 'package:flutter/material.dart';

class Itemchat extends StatelessWidget {
  const Itemchat({
    super.key,
    required this.sender,
    required this.message,
    required this.time,
  });

  final String sender;
  final String message;
  final String time;

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

        Navigator.pushNamed(context, '/chat');
      },
    );
  }
}
