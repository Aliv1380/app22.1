

import 'package:flutter/material.dart';

class NavigstionDrawerScreen extends StatefulWidget {
  const NavigstionDrawerScreen({Key? key}) : super(key: key);

  @override
  _NavigstionDrawerScreenState createState() => _NavigstionDrawerScreenState();
}

class _NavigstionDrawerScreenState extends State<NavigstionDrawerScreen> {
  final _messengerKey = GlobalKey<ScaffoldMessengerState>();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scaffoldMessengerKey: _messengerKey,

      home: Scaffold(
        appBar: AppBar(),
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
        body: Center(child: Text('Ghbdtn')),
      ),
    );
  }
}
