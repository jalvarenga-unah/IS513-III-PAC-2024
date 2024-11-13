import 'package:clone_whatsapp/src/modules/auth/pages/login_page.dart';
import 'package:clone_whatsapp/src/modules/contacts/pages/chat_page.dart';
import 'package:clone_whatsapp/src/modules/contacts/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() => runApp(const MyApp());

final GoRouter _router = GoRouter(
  initialLocation: '/',
  routes: <RouteBase>[
    GoRoute(
        path: '/',
        name: 'home',
        builder: (BuildContext context, GoRouterState state) {
          return const HomePage();
        },
        routes: [
          GoRoute(
            path: '/chat/:chatId',
            name: 'chat',
            builder: (BuildContext context, GoRouterState state) {
              return const ChatPage();
            },
          ),
        ]),
    GoRoute(
      path: '/login',
      builder: (BuildContext context, GoRouterState state) {
        return LoginPage();
      },
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Clone Whatsapp',
      routerConfig: _router,
      // home: LoginPage(),
      // initialRoute: '/login',
      // routes: {
      //   '/': (context) => const HomePage(),
      //   '/chat': (context) => const ChatPage(),
      //   '/login': (context) => LoginPage()
      // },
      //TODO: Revisar que ocurre con esto!!!!!
      // onGenerateRoute: (settings) => MaterialPageRoute(
      //   builder: (context) {
      //     if (settings.name == '/') return HomePage();

      //     return const PageNotFound();
      //   },
      // ),
    );
  }
}
