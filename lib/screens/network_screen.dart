import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

//создаем класс аналогичный загружаемым данным, и в нем функцию создающую объекты из источника данных
class Post {
  final int userId;
  final int id;
  final String title;
  final String body;
  Post({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });
  factory Post.fromJson(Map<String, dynamic> json){
    return Post(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }
}
//получает данные, конвертирует и возвращает объект
Future<Post> fetchPost() async{
  final response =  await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts/1'));
  if (response.statusCode ==200) {
    return Post.fromJson(jsonDecode(response.body));
  } else{
    throw Exception('Failed to load album');
  }
}

//наш экран
class NetworkScreen extends StatefulWidget {
  const NetworkScreen({Key? key}) : super(key: key);
  @override
  State<NetworkScreen> createState() => _NetworkScreenState();
}

class _NetworkScreenState extends State<NetworkScreen> {
  late Future<Post> futurePost;
  @override
  void initState(){
    super.initState();
    futurePost = fetchPost();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Пример загрузки данных',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        appBar: AppBar(title: Text('Загрузка поста'),),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: FutureBuilder<Post>(
              future: futurePost,
              builder: (context,snapshot){
                if (snapshot.hasData){
                  return Column(
                    children: [
                      Text(snapshot.data!.title),
                      Divider(),
                      Text(snapshot.data!.body),
                    ],
                  );
                }else if (snapshot.hasError){
                  return Text('${snapshot.error}');
                }
                return const CircularProgressIndicator();
              },
            ),
          ),
        ),
      ),
    );
  }
}
