import 'package:flutter/material.dart';

import 'domain/models/post.dart';
import 'domain/services/post_service.dart';

void main() => runApp(MyApp(key: const Key('post'), post: fetchPost(1)));

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  late Future<Post> post;

  MyApp({required Key key, required this.post}) : super(key: key);

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
          child: FutureBuilder<Post>(
            future: post,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                Widget card = Center(
                  child: Card(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        ListTile(
                          leading: const Icon(Icons.post_add),
                          title: Text(snapshot.data!.title),
                          subtitle: Text(snapshot.data!.body),
                        ),
                      ],
                    ),
                  ),
                );
                return card;
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              // Por defecto, muestra un loading spinner
              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
