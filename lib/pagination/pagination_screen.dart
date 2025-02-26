import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PaginatedListView extends StatefulWidget {
  const PaginatedListView({super.key});

  @override
  PaginatedListViewState createState() => PaginatedListViewState();
}

class PaginatedListViewState extends State<PaginatedListView> {
  final List<dynamic> _posts = [];
  bool _isLoading = false;
  int _page = 1;
  final int _limit = 5;

  Future<void> _fetchData() async {
    if (_isLoading) return;
    setState(() {
      _isLoading = true;
    });

    final response = await http.get(
      Uri.parse(
          'https://jsonplaceholder.typicode.com/posts?_page=$_page&_limit=$_limit'),
    );

    if (response.statusCode == 200) {
      List<dynamic> newPosts = json.decode(response.body);
      setState(() {
        _posts.addAll(newPosts);
        _page++;
      });
    } else {
      log('"Error: ${response.statusCode}"');
    }

    setState(() {
      _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  @override
  Widget build(BuildContext context) {
    log('build');
    return Scaffold(
      appBar: AppBar(title: Text("Flutter Pagination")),
      body: ListView.builder(
        itemCount: _posts.length + 1,
        itemBuilder: (context, index) {
          if (index == _posts.length) {
            if (_isLoading) {
              return Center(child: CircularProgressIndicator());
            } else {
              return SizedBox();
            }
          }

          final post = _posts[index];
          return Card(
            color: Colors.primaries[index % Colors.primaries.length],
            child: ListTile(
              title: Text(post['title']),
              subtitle: Text(
                post['body'],
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _fetchData,
        child: Icon(Icons.refresh),
      ),
    );
  }
}
