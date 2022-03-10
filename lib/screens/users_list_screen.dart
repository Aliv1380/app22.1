
import 'package:app22/screens/user_tasks.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:ui';

import '../main.dart';

//Загрузка данных
//создаем класс аналогичный загружаемым данным, и в нем функцию создающую объекты из источника данных
//у пользователя нужны только основные данные пользователя - id, имя и email
class User {
  final int id;
  final String name;
  final String username;
  final String email;
  final String phone;
  final String website;
  final Company company;
  final Address address;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.username,
    required this.phone,
    required this.website,
    required this.company,
    required this.address,
//
  });
  factory User.fromJson(Map<String, dynamic> json){
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      username: json['username'],
      phone: json['phone'],
      website: json['website'],
      company: Company(
        name: json['company']['name'],
        catchPhrase: json['company']['catchPhrase'],
        bs: json['company']['bs'],
      ),


      address: Address(
        street: json['address']['street'],
        suite: json['address']['suite'],
        city: json['address']['city'],
        zipcode: json['address']['zipcode'],
        geo: Geo(
            lat: json['address']['geo']['lat'],
            lng: json['address']['geo']['lng'])

      ),

      // street: json['street'],
      // suite: json['suite'],
      // city: json['city'],
      // zipcode: json['zipcode'],
 //     company: ,
      //
      // company: json['company'],
      // company: json['company'],
      // company: json['company'],
      // company: json['company'],
    );
  }
}

//
class Company {
  final String name;
  final String catchPhrase;
  final String bs;
  Company({
    required this.name,
    required this.catchPhrase,
    required this.bs,
  });
  factory Company.fromJson(Map<String, dynamic> json){
    return Company(
      name: json['name'],
      catchPhrase: json['catchPhrase'],
      bs: json['bs'],
    );
  }
}
//
//
class Geo {
  final String lat;
  final String lng;
  Geo({
    required this.lat,
    required this.lng,
  });
  factory Geo.fromJson(Map<String, dynamic> json){
    return Geo(
      lat: json['lat'],
      lng: json['lng'],
    );
  }
}
//
class Address {
  final String street;
  final String suite;
  final String city;
  final String zipcode;
  final Geo geo;
  Address({
    required this.street,
    required this.suite,
    required this.city,
    required this.zipcode,
    required this.geo,
  });
  factory Address.fromJson(Map<String, dynamic> json){
    return Address(
      street: json['street'],
      suite: json['suite'],
      city: json['city'],
      zipcode: json['zipcode'],
      geo: json['zipcode'],
    );
  }
}


//загружать будем не просто пользователя, а список пользователей, по этому применяем <List<User>>
Future<List<User>> fetchUsers() async{
  final response =  await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
  if (response.statusCode ==200) {
    List jsonResponse = json.decode(response.body);
    return jsonResponse.map((user) => User.fromJson(user)).toList();
  } else{
    throw Exception('Failed to load Users');
  }
}

Future<List<Company>> fetchCompany() async{
  final response =  await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
  if (response.statusCode ==200) {
    List jsonResponse = json.decode(response.body);
    return jsonResponse.map((company) => Company.fromJson(company)).toList();
  } else{
    throw Exception('Failed to load Users');
  }
}


//отрисовка экрана
class UsersListScreen extends StatelessWidget {
  UsersListScreen({Key? key}) : super(key: key);
  final _messengerKey = GlobalKey<ScaffoldMessengerState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scaffoldMessengerKey: _messengerKey,

      home: Scaffold(
        appBar: AppBar(
          title: const Text('Список пользователей'),
        ),

        //---------------------------------------------------------------------
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
                  Navigator.pushNamed(context, '/');
                },
              ),
              ListTile(
                leading: const Icon(Icons.one_k),
                title: const Text('Экран пользователей'),
                onTap: () {
                  Navigator.pushNamed(context, '/users_list');
                },
              ),
              ListTile(
                leading: const Icon(Icons.one_k),
                title: const Text('Экран регистрации'),
                onTap: () {
                  Navigator.pushNamed(context, '/reg');
                },
              ),
              ListTile(
                leading: const Icon(Icons.one_k),
                title: const Text('Экран ошибки'),
                onTap: () {
                  Navigator.pushNamed(context, '/login_error');
                },
              ),
            ],
          ),

        ),
        body: ClicUsersListBuilder(),
      ),
    );
  }
}

//формирование кликабельного списка------------------------------------------------------------------------------
class ClicUsersListBuilder extends StatefulWidget {
  const ClicUsersListBuilder({Key? key}) : super(key: key);
  @override
  _ClicUsersListBuilderState createState() => _ClicUsersListBuilderState();
}
class _ClicUsersListBuilderState extends State<ClicUsersListBuilder> {
  late Future<List<User>> futureUsersList;
  late List<User> usersListData;
  //_selectedIndex - для передачи в раскрываемое окно
  int _selectedIndex = 0;
  @override
  void initState() {
    super.initState();
//fetchUsers - загружает список данных пользователей из интернета
    futureUsersList = fetchUsers();
  }
  @override
  Widget build(BuildContext context) {
    //-------------------------------------------------
    return Center(
      child: FutureBuilder<List<User>>(
        future: futureUsersList,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            usersListData = snapshot.data!;
//пр1._userListTile возвращает виджет ListTile, в заголовок которого передается имя, в подзаголовок емайл, в иконку иконка ворк
//здесь важно что передается в эту функцию как usersListData
//usersListData это данные для билдера
         //   return _usersListView(usersListData);
            return ListView.builder(
              //количество должно соответствовать кол-ву позиций в списке полученном из http
                itemCount: usersListData.length,
                itemBuilder: (context, int index) {
                  return ListTile(
                    // нужно добавить в список основные данные пользователя - id, имя и email
                    title: Text('ID # ${usersListData[index].id}  user name ${usersListData[index].name}'),
                    subtitle: Text(usersListData[index].email),
                    onTap: (){
       //               Navigator.pushNamed(context, '/tasks', arguments: usersListData[index]);
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>UserTasksScreen(usersListData[index])));
                      setState(() {
                        _selectedIndex = index;
                      });
                    },
                  );
                }
            );
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          return const CircularProgressIndicator();
        }
      ),
    );




    //-------------------------------------------------------


  }
}
//конец формирования кликабельного списка


