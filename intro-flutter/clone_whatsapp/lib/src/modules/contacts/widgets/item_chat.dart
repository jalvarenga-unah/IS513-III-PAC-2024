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
    );
  }
}
