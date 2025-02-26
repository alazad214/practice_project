import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class BetterPaginationScreen extends StatefulWidget {
  const BetterPaginationScreen({super.key});

  @override
  BetterPaginationScreenState createState() => BetterPaginationScreenState();
}

class BetterPaginationScreenState extends State<BetterPaginationScreen> {
  List<dynamic> postList = [];
  bool isLoading = false;
  bool isMoreData = true;
  int pageNo = 1;
  final int limitData = 5;

  Future<void> fetchDummyData() async {
    if (isLoading || !isMoreData) return;

    setState(() {
      isLoading = true;
    });

    final response = await http.get(
      Uri.parse(
          'https://jsonplaceholder.typicode.com/posts?pageNo=$pageNo&limitData=$limitData'),
    );

    if (response.statusCode == 200) {
      List<dynamic> newPosts = json.decode(response.body);
      setState(() {
        postList.addAll(newPosts);
        pageNo++;
        if (newPosts.length < limitData) {
          isMoreData = false;
        }
      });
    } else {
      log('Error: ${response.statusCode}');
    }

    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    fetchDummyData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Flutter Pagination")),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: postList.length,
              itemBuilder: (context, index) {
                final post = postList[index];
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
            if (isMoreData)
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton(
                  onPressed: fetchDummyData,
                  child: isLoading
                      ? CircularProgressIndicator(color: Colors.white)
                      : Text('Load More'),
                ),
              ),
            if (!isMoreData)
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text('No more data to load'),
              ),
          ],
        ),
      ),
    );
  }
}
