import 'package:clone_whatsapp/src/modules/contacts/pages/chat_page.dart';
import 'package:clone_whatsapp/src/modules/contacts/pages/home_page.dart';
import 'package:clone_whatsapp/src/shared/pages/page_not_found.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Clone Whatsapp',
      // home: const HomePage(),
      initialRoute: '/home',
      routes: {
        '/home': (context) => const HomePage(),
        '/chat': (context) => const ChatPage(),
      },
      onGenerateRoute: (settings) => MaterialPageRoute(
        builder: (context) {
          print(settings.name);

          return const PageNotFound();
        },
      ),
    );
  }
}
