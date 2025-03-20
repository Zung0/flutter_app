import 'dart:ffi';

class ResponsePost {
  List<Post> posts;

  ResponsePost({required this.posts});

  Map<String, dynamic> toMap() {
    return {'posts': this.posts};
  }

  factory ResponsePost.fromMap(Map<String, dynamic> map) {
    return ResponsePost(posts: map['posts'] as List<Post>);
  }
}

class Post {
  int id;
  String profile;
  int created_date;
  String author;
  String message;

  Post({
    required this.id,
    required this.profile,
    required this.created_date,
    required this.author,
    required this.message,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'profile': this.profile,
      'created_date': this.created_date,
      'author': this.author,
      'message': this.message,
    };
  }

  factory Post.fromMap(Map<String, dynamic> map) {
    return Post(
      id: map['id'] as int,
      profile: map['profile'] as String,
      created_date: map['created_date'] as int,
      author: map['author'] as String,
      message: map['message'] as String,
    );
  }
}
