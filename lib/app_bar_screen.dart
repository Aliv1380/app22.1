import 'package:flutter/material.dart';

class MyAppBar extends StatefulWidget {
  const MyAppBar({Key? key}) : super(key: key);

  @override
  _MyAppBarState createState() => _MyAppBarState();
}

class _MyAppBarState extends State<MyAppBar> {
  final _messengerKey = GlobalKey<ScaffoldMessengerState>();
  @override
  Widget build(BuildContext context) {

    final ButtonStyle buttonStyle = TextButton.styleFrom(primary: Theme.of(context).colorScheme.onPrimary);


    return MaterialApp(
      scaffoldMessengerKey: _messengerKey,

      home: Scaffold(
        appBar: AppBar(
          title: Text('titl AppBar'),
          actions: <Widget>[
            IconButton(onPressed: (){}, icon: Icon(Icons.account_balance)),
            IconButton(tooltip: 'Часы', onPressed: (){}, icon: Icon(Icons.access_alarm_sharp)),
            IconButton(onPressed: (){}, icon: Icon(Icons.account_tree)),
            TextButton(
              onPressed: (){},
              child: Text('TextButton'),
              style: buttonStyle,
              //выше задается значение этой переменной buttonStyle = TextButton.styleFrom(primary: Theme.of(context).colorScheme.onPrimary),),
            ),

          ],
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
                  height: 200,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 100,
                        child: Image.network('https://upload.wikimedia.org/wikipedia/commons/thumb/4/44/Google-flutter-logo.svg/768px-Google-flutter-logo.svg.png'),
                      ),

                      Text('Навигация'),
                    ],
                  ),
                ),
              ),

              ListTile(
                leading: const Icon(Icons.one_k),
                title: const Text('Каталог'),
                onTap: () {
                  _messengerKey.currentState!.showSnackBar(
                      const SnackBar(content: Text('Переход в меню')));
                },
              ),
              ListTile(
                leading: const Icon(Icons.one_k),
                title: const Text('Каталог'),
                onTap: () {
                  _messengerKey.currentState!.showSnackBar(
                      const SnackBar(content: Text('Переход в меню')));
                },
              ),
              const Divider(),
              const Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: Text('Настройки'),
              ),
              ListTile(
                leading: const Icon(Icons.settings),
                title: const Text('settings'),
                onTap: () {
                  _messengerKey.currentState!.showSnackBar(
                      const SnackBar(content: Text('Переход в меню settings')));
                },
              ),
              ListTile(
                leading: const Icon(Icons.search),
                title: const Text('search'),
                onTap: () {
                  _messengerKey.currentState!.showSnackBar(
                      const SnackBar(content: Text('Переход в меню search')));
                },
              ),
            ],
          ),

        ),


        body: Text('Привет'),
      ),
    );
  }
}
