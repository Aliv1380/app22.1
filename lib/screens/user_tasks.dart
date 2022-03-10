
import 'package:app22/screens/first_screen.dart';
import 'package:app22/screens/registration_screen.dart';
import 'package:app22/screens/users_list_screen.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'error_screen.dart';


class Tasks {
  final int userId;
  final int id;
  final String title;
   bool completed;
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
Future<List<Tasks>> fetchTasks(int id) async{
  final response =  await http.get(Uri.parse('https://jsonplaceholder.typicode.com/todos?userId=${id.toString()}'));
  if (response.statusCode ==200) {
    List jsonResponse = json.decode(response.body);
    return jsonResponse.map((user) => Tasks.fromJson(user)).toList();
  } else{
    throw Exception('Failed to load Users');
  }
}

//отрисовка экрана
class UserTasksScreen extends StatelessWidget {
  User user;

  UserTasksScreen(this.user);


  @override
  Widget build(BuildContext context) {
    //print(params.name);
    return Scaffold(
        body: UserTasks(user),
      );

  }
}

//формирование кликабельного списка------------------------------------------------------------------------------
class UserTasks extends StatefulWidget {
  User user;
  UserTasks(this.user, {Key? key}) : super(key: key);
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
    futureTasksList = fetchTasks(widget.user.id);
  }
  final _messengerKey = GlobalKey<ScaffoldMessengerState>();
  @override
  Widget build(BuildContext context) {
    //-------------------------------------------------
    return MaterialApp(
      scaffoldMessengerKey: _messengerKey,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Task list'),
        ),


        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: const BoxDecoration(
                  color: Colors.blue,
                ),
                child: Container(
                  height: 500,
                  child: Text('Навигация'),
                ),
              ),

              ListTile(
                leading: const Icon(Icons.one_k),
                title: const Text('Экран авторизации'),
                onTap: () {
            //      Navigator.pushNamed(context, '/');
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>MyFirstScreen()));
                },
              ),
              ListTile(
                leading: const Icon(Icons.one_k),
                title: const Text('Экран пользователей'),
                onTap: () {
                //  Navigator.pushNamed(context, '/users_list');
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>UsersListScreen()));

                },
              ),
              ListTile(
                leading: const Icon(Icons.one_k),
                title: const Text('Экран регистрации'),
                onTap: () {
               //   Navigator.pushNamed(context, '/reg');
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>RegScreen()));
                },
              ),
              ListTile(
                leading: const Icon(Icons.one_k),
                title: const Text('Экран ошибки'),
                onTap: () {
                 // Navigator.pushNamed(context, '/login_error');
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>ErrorScreen()));
                },
              ),
            ],
          ),

        ),


        body: Padding(
          padding: const EdgeInsets.all(8.0),
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
                                Expanded(child: Text('ID # ${TasksListData[index].id}  title  ${TasksListData[index].title}')),
                                Checkbox(value: TasksListData[index].completed,
                                    onChanged: (bool? newValue) {
                                      setState(() {
                                        TasksListData[index].completed = !TasksListData[index].completed;
                                      });
                                    },
                                ),
                              ],
                            ),
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
    );




    //-------------------------------------------------------


  }
}
//конец формирования кликабельного списка


