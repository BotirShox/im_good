import 'dart:convert';
import 'package:im_good/models/album.dart';
import 'package:im_good/models/comment.dart';
import 'package:im_good/models/photo.dart';
import 'package:im_good/models/post.dart';
import 'package:im_good/models/user.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ApiService {
  static const endpoint = 'https://jsonplaceholder.typicode.com';

  var client = http.Client();

  Future getUsers() async {
    final users = <User>[];
    var response = await client.get(Uri.parse('$endpoint/users'));
    var parsed = json.decode(response.body);

    for (var user in parsed) {
      var u = User.fromMap(user);
      users.add(u);
    }
    SharedPreferences prefUser = await SharedPreferences.getInstance();
    prefUser.setString('stringUser', "$users");
    return users;
  }

  Future getUserPosts(int userId) async {
    final posts = <Post>[];
    var response = await client.get(Uri.parse('$endpoint/users/$userId/posts'));
    var parsed = json.decode(response.body);

    for (var post in parsed) {
      var p = Post.fromMap(post);
      posts.add(p);
    }
    SharedPreferences prefPost = await SharedPreferences.getInstance();
    prefPost.setString('stringPost', "$posts");
    return posts;
  }

  Future getUserAlbums(int userId) async {
    final albums = <Album>[];
    var response =
        await client.get(Uri.parse('$endpoint/users/$userId/albums'));
    var parsed = json.decode(response.body);

    for (var album in parsed) {
      var a = Album.fromMap(album);
      albums.add(a);
    }
    SharedPreferences prefAl = await SharedPreferences.getInstance();
    prefAl.setBool('$albums', true);
    return albums;
  }

  Future getPostComments(int postId) async {
    final comments = <Comment>[];
    var response =
        await client.get(Uri.parse('$endpoint/posts/$postId/comments'));
    var parsed = json.decode(response.body);

    for (var comment in parsed) {
      var c = Comment.fromMap(comment);
      comments.add(c);
    }
    SharedPreferences prefCom = await SharedPreferences.getInstance();
    prefCom.setString('stringComment', "$comments");
    return comments;
  }

  Future<void> postComment(Comment comment) async {
    var url = Uri.parse('$endpoint/posts');
    var response = await http.post(url, body: {
      'name': comment.name,
      'body': comment.body,
    });
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('stringCom', response.body);
  }

  Future getAlbumPhotos(int albumId) async {
    final photos = <Photo>[];
    var response =
        await client.get(Uri.parse('$endpoint/albums/$albumId/photos'));
    var parsed = json.decode(response.body);

    for (var photo in parsed) {
      var p = Photo.fromMap(photo);
      photos.add(p);
    }
    return photos;
  }
  getStringValuesSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? stringUser = prefs.getString('stringUser');
    return stringUser;
  }
}
