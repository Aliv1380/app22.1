
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;


class Tasks {
  final int userId;
  final int id;
  final String title;
  final bool completed;
  Tasks({
    required this.userId,
    required this.id,
    required this.title,
    required this.completed,
  });
  factory Tasks.fromJson(Map<String, dynamic> json){
    return Tasks(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      completed: json['completed'],
    );
  }
}

//загружать будем не просто пользователя, а список пользователей, по этому применяем <List<User>>
Future<List<Tasks>> fetchTasks() async{
  final response =  await http.get(Uri.parse('https://jsonplaceholder.typicode.com/todos?userId=1'));
  if (response.statusCode ==200) {
    List jsonResponse = json.decode(response.body);
    return jsonResponse.map((user) => Tasks.fromJson(user)).toList();
  } else{
    throw Exception('Failed to load Users');
  }
}

//отрисовка экрана
class UserTasksScreen extends StatelessWidget {
  const UserTasksScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: UserTasks(),
      ),
    );
  }
}

//формирование кликабельного списка------------------------------------------------------------------------------
class UserTasks extends StatefulWidget {
  const UserTasks({Key? key}) : super(key: key);
  @override
  _UserTasksState createState() => _UserTasksState();
}
class _UserTasksState extends State<UserTasks> {
  late Future<List<Tasks>> futureTasksList;
  late List<Tasks> TasksListData;

  @override
  void initState() {
    super.initState();
//fetchUsers - загружает список данных пользователей из интернета
    futureTasksList = fetchTasks();
  }
  @override
  Widget build(BuildContext context) {
    //-------------------------------------------------
    return MaterialApp(
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            child: Center(
              child: FutureBuilder<List<Tasks>>(
                  future: futureTasksList,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      TasksListData = snapshot.data!;

                      return ListView.builder(
                        //количество должно соответствовать кол-ву позиций в списке полученном из http
                          itemCount: TasksListData.length,
                          itemBuilder: (context, int index) {
                            return ListTile(
                              title: Row(
                                children: [
                                  //Text('hello'),
                                  Container(child: Text('ID # ${TasksListData[index].id}  title  ${TasksListData[index].title}')),
                                  Checkbox(value: TasksListData[index].completed,
                                      onChanged: (bool? newValue) {
                                        setState(() {});
                                      },
                                  ),
                                ],
                              ),
                              //subtitle: Text(TasksListData[index].completed),
                              // onTap: (){
                              //   setState(() {
                              //     _selectedIndex = index;
                              //   });
                              // },
                            );
                          }
                      );
                    } else if (snapshot.hasError) {
                      return Text('${snapshot.error}');
                    }
                    return const CircularProgressIndicator();
                  }
              ),
            ),
          ),
        ),
      ),
    );




    //-------------------------------------------------------


  }
}
//конец формирования кликабельного списка


