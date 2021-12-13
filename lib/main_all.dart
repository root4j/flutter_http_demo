import 'package:flutter/material.dart';

import 'domain/models/post.dart';
import 'domain/services/post_service.dart';

void main() => runApp(MyApp());

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  late Future<List<Post>> posts;

  MyApp({Key? key}) : super(key: key) {
    posts = fetchPosts();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Fetch Data Example'),
        ),
        body: Center(
          child: FutureBuilder<List<Post>>(
            future: posts,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              }

              if (!snapshot.hasData) {
                return const Center(
                  child: Text("No data found"),
                );
              }

              List<Post>? postList = snapshot.data;
              return ListView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: postList!.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        ListTile(
                          leading: const Icon(Icons.post_add),
                          title: Text(postList[index].title),
                          subtitle: Text(postList[index].body),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
