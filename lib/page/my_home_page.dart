import 'package:flutter/material.dart';
import 'package:projet_fil_rouge/page/widgets/posts.dart';
import 'package:projet_fil_rouge/page/widgets/top_bar.dart';

void main() => runApp(MyHomePage());

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Material App', home: HomePage());
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.blue, title: Text('oiseau')),
      body: Column(children: [TopBar(), Posts()]),
    );
  }
}






