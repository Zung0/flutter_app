import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Posts extends StatefulWidget {
  const Posts({super.key});

  @override
  State<Posts> createState() => _PostsState();
}

class _PostsState extends State<Posts> {
  bool likedOrNot = false;
  bool replyMode = false;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        children: [
          Card(
            child: Column(
              children: [
                Row(
                  children: [
                    SizedBox(
                      height: 125,
                      width: 125,
                      child: Image.network(
                        "https://static.wikia.nocookie.net/continued-exe/images/5/58/Sanic_hegehog.png/revision/latest?cb=20240514173553",
                        fit: BoxFit.cover,
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Row(children: [Text("user"), Spacer(), Text("20s")]),
                          const SizedBox(height: 5),
                          const Text(
                            "bla bla très long texte de merde parceque je sais pas comment se comporte la moitié de ce que j'utilise et que ça devient embetant les textes qui dépassent !! ",
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                      onPressed: () {
                        setState(() {
                          replyMode = !replyMode;
                        });
                      },
                      icon: Icon(Icons.reply),
                    ),
                    IconButton(onPressed: () {}, icon: Icon(Icons.replay)),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          likedOrNot = !likedOrNot;
                        });
                      },
                      icon:
                      likedOrNot
                          ? Icon(Icons.favorite, color: Colors.red)
                          : Icon(Icons.favorite_border),
                    ),
                  ],
                ),
                replyMode
                    ? TextField(
                  autofillHints: [AutofillHints.email],
                  decoration: InputDecoration(
                    hintText: "Votre commentaire",
                  ),
                )
                    : Container(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}