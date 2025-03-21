import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PostListScreen extends StatefulWidget {
  const PostListScreen({super.key});

  @override
  _PostListScreenState createState() => _PostListScreenState();
}

class _PostListScreenState extends State<PostListScreen> {
  late Future<List<Map<String, dynamic>>> posts;

  @override
  void initState() {
    super.initState();
    posts = fetchPosts();
  }


  Future<List<Map<String, dynamic>>> fetchPosts() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

    if (response.statusCode == 200) {
      // If the server returns a 200 OK response, parse the JSON
      List<dynamic> data = json.decode(response.body);
      return data.map((postJson) => postJson as Map<String, dynamic>).toList();
    } else {
      throw Exception('Failed to load posts');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Posts from JSONPlaceholder'),
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: posts,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No posts available'));
          } else {
            List<Map<String, dynamic>> posts = snapshot.data!;
            return ListView.builder(
              itemCount: posts.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(posts[index]['title']),
                  subtitle: Text(posts[index]['body']),
                  leading:
                      CircleAvatar(child: Text(posts[index]['id'].toString())),
                );
              },
            );
          }
        },
      ),
    );
  }
}
