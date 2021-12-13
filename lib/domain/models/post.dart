// Clase que representara un Post
class Post {
  // Artibutos
  final int userId;
  final int id;
  final String title;
  final String body;
  // Constructor
  Post(this.userId, this.id, this.title, this.body);
  // Metodo de conversión de JSON a Objeto
  Post.fromJson(Map<String, dynamic> json)
      : userId = json['userId'],
        title = json['title'],
        body = json['body'],
        id = json['id'];
  // Metodo de conversión de Objeto a JSON
  Map<String, dynamic> toJson() => {
        'userId': userId,
        'title': title,
        'id': id,
        'body': body,
      };
}