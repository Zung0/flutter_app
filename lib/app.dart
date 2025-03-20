import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:projet_fil_rouge/page/my_login_page.dart';

import 'page/my_home_page.dart';

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (_, __) => MyLoginPage()),
      GoRoute(path: '/home/:email', builder: (_, state) {return MyHomePage();},),
    ],
  );

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
        ),
      ),
    );
  }
}
