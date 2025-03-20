import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SignIn extends StatefulWidget {

  const SignIn({super.key});

  @override
  State<SignIn> createState() => SignInState();
}

class SignInState extends State<SignIn> {
  final controllerEmail = TextEditingController();
  final controllerPassword = TextEditingController();
  bool rememberMe = false;
  final _keyForm = GlobalKey<FormState>();

  String? validateEmail(String? content) {
    if (content != null &&
        content.isNotEmpty &&
        content.contains("@")) {
      return null;
    }
    return "Renseignez un e-mail";
  }

  String? validatePassword(String? content) {
    if (content != null && content.isNotEmpty) {
      return null;
    }
    return "Veuillez renseigner un mot de passe";
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: AutovalidateMode.onUnfocus,
      key: _keyForm,
      child: Column(
        children: [
          Text("Connexion"),
          Padding(
            padding: const EdgeInsets.all(32),
            child: Column(
              spacing: 8,
              children: [
                TextFormField(
                  controller: controllerEmail,
                  validator: validateEmail,
                  decoration: InputDecoration(
                    labelText: "E-mail",
                    hintText: "jhon@doe.com",
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
                TextFormField(
                  controller: controllerPassword,
                  validator: validatePassword,
                  decoration: InputDecoration(
                    labelText: "Password",
                    hintText: "Tr0uDCu1",
                  ),
                  obscureText: true,
                ),
                Row(
                  mainAxisAlignment:
                      MainAxisAlignment.center,
                  children: [
                    Switch(
                      activeColor: Colors.blue,
                      value: rememberMe,
                      onChanged: (value) {
                        setState(() {
                          rememberMe = value ?? false;
                        });
                      },
                    ),
                    Column(
                      children: [Text("Remember me ?")],
                    ),
                  ],
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                    onPressed: () =>
                      context.go('/home'),

                    child: Text(
                      "Me contacter",
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
