import 'package:flutter/material.dart';
import 'package:projet_fil_rouge/page/widgets/sign_in.dart';

void main() => runApp(MyLoginPage());

class MyLoginPage extends StatelessWidget {
  const MyLoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(title: Text('Material App Bar')),
        body:  SignIn(),
      ),
    );
  }
}
