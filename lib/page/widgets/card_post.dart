import 'package:flutter/material.dart';

import '../data/post_data_class.dart';

class CardPost extends StatefulWidget {
  final List<Post> listPost;

  const CardPost(this.listPost, {super.key});

  @override
  State<CardPost> createState() => _CardPostState();
}

class _CardPostState extends State<CardPost> {
  bool likedOrNot = false;
  late List<bool> replyModes;

  @override
  void initState() {
    super.initState();
    // Initialiser tous les modes de réponse à false.
    replyModes = List.generate(widget.listPost.length, (index) => false);
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.listPost.length,
      itemBuilder: (context, index) => ListTile(
        title: Card(
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
                        Row(
                          children: [
                            Text(widget.listPost[index].author),
                            Spacer(),
                            Text("20s"),

                        ]),
                        const SizedBox(height: 5),
                        Text(widget.listPost[index].message),
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
                        // Met à jour seulement le mode de réponse de l'élément actuel.
                        replyModes[index] = !replyModes[index];
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
                    icon: likedOrNot
                        ? Icon(Icons.favorite, color: Colors.red)
                        : Icon(Icons.favorite_border),
                  ),
                ],
              ),
              replyModes[index]
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
      ),
    );
  }
}
