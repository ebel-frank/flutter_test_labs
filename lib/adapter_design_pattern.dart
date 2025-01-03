// Adapter design pattern
import 'dart:convert';

class YoutubeAPI {
  String getPost() {
    return """
    [
    {
      "title": "Introduction to Flutter",
      "description": "Learn all the nity grities of Flutter development"
    },
    {
      "title": "Fundamental of Programming",
      "description": "Grow and learn with Frank"
    }
    ]
    """;
  }
}

class TwitterAPI {
  String getPost() {
    return """
    [
    {
      "header": "Introduction to Flutter",
      "bio": "Learn all the nity grities of Flutter development"
    },
    {
      "header": "Fundamental of Programming",
      "bio": "Grow and learn with Frank"
    }
    ]
    """;
  }
}

abstract class PostsAPI {
  List<Post> getPosts();
}

class Post {
  final String title;
  final String bio;

  Post({required this.title, required this.bio});
  
  @override
  String toString() => "Title: ${title}, Bio: ${bio}";
}

class YoutubeAdapter implements PostsAPI {
  final YoutubeAPI ytApi = YoutubeAPI();

  @override
  List<Post> getPosts() {
    return jsonDecode(ytApi.getPost())
        .map<Post>((e) => Post(title: e['title'], bio: e['description'])).toList();
  }
}

class TwitterAdapter implements PostsAPI {
  final TwitterAPI twApi = TwitterAPI();

  @override
  List<Post> getPosts() {
    return jsonDecode(twApi.getPost())
        .map<Post>((e) => Post(title: e['header'], bio: e['bio'])).toList();
  }
}

class RemoteAPI {
  static final _ytAdapter = YoutubeAdapter();
  static final _twAdapter = TwitterAdapter();

  static List<Post> getPosts() {
    return _ytAdapter.getPosts() + _twAdapter.getPosts();
  }
}

void main() {
  print("Getting all my posts");
  List<Post> posts = RemoteAPI.getPosts();
  print(posts);
}
