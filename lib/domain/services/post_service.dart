import 'package:flutter_http_demo/domain/models/post.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// Metodo que me permite obtener un Post por su Id
Future<Post> fetchPost(int post) async {
  // Se define la URL de la API
  final url = Uri.https(
    'jsonplaceholder.typicode.com',
    '/posts/$post',
  );

  // Se realiza la invocacion del servicio
  final response = await http.get(url);

  // Se pregunta si la respuesta fue exitosa
  if (response.statusCode == 200) {
    // Si el servidor devuelve una respuesta OK, parseamos el JSON
    return Post.fromJson(json.decode(response.body));
  } else {
    // Si esta respuesta no fue OK, lanza un error.
    throw Exception('Failed to load post');
  }
}

// Metodo que me permite obtener un Post por su Id
Future<List<Post>> fetchPosts() async {
  // Se define la URL de la API
  final url = Uri.https(
    'jsonplaceholder.typicode.com',
    '/posts/',
  );

  // Se realiza la invocacion del servicio
  final response = await http.get(url);

  // Se pregunta si la respuesta fue exitosa
  if (response.statusCode == 200) {
    Iterable l = json.decode(response.body);
    // Si el servidor devuelve una respuesta OK, parseamos el JSON
    return List<Post>.from(l.map((model) => Post.fromJson(model)));
  } else {
    // Si esta respuesta no fue OK, lanza un error.
    throw Exception('Failed to load post');
  }
}
