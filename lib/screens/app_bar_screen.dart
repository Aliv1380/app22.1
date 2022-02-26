//Экран  appBar + NavigationDrawer + настройка темы

import 'package:app22/utils/global_theme.dart';
import 'package:flutter/material.dart';

final _messengerKey = GlobalKey<ScaffoldMessengerState>();
//final ButtonStyle buttonStyle = TextButton.styleFrom(primary: Theme.of(context).colorScheme.onPrimary);

Widget _navigationDraw(context, _darcTheme) =>Drawer(
  child: ListView(
    padding: EdgeInsets.zero,
    children: [
      DrawerHeader(
        decoration:
        BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
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
        title:  Text('Каталог',
          style: Theme.of(context).textTheme.headline6,
        ),
   //     style:   Theme.of(context).textTheme.headline6,
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

      // Text('Дополнительный сыр'),
  //     Switch(
  //       value: _darcTheme,
  //       onChanged: (val) {
  //         setState(() {
  //           _darcTheme=!_darcTheme;
  //
  //         });
  //       },
  //     ),
  //

    ],
  ),

);

PreferredSizeWidget _myAppBar(context)=>AppBar(
  title: Text('titl AppBar'),
  actions: <Widget>[
    IconButton(onPressed: (){}, icon: Icon(Icons.account_balance)),
    IconButton(tooltip: 'Часы', onPressed: (){}, icon: Icon(Icons.access_alarm_sharp)),
    IconButton(onPressed: (){}, icon: Icon(Icons.account_tree)),
    TextButton(
      onPressed: (){},
      child: Text('TextButton'),
      style: TextButton.styleFrom(primary: Theme.of(context).colorScheme.onPrimary),
      //выше задается значение этой переменной buttonStyle = TextButton.styleFrom(primary: Theme.of(context).colorScheme.onPrimary),),
    ),
  ],
);

class MyAppBarScreen extends StatefulWidget {
  const MyAppBarScreen({Key? key}) : super(key: key);
  @override
  _MyAppBarScreenState createState() => _MyAppBarScreenState();
}

class _MyAppBarScreenState extends State<MyAppBarScreen> {
  @override
  bool _darcTheme = false;

  Widget build(BuildContext context) {
    final ButtonStyle buttonStyle = TextButton.styleFrom(primary: Theme.of(context).colorScheme.onPrimary);
    return MaterialApp(
      scaffoldMessengerKey: _messengerKey,
      theme: globalTheme(),
      home: Scaffold(
        appBar: _myAppBar(context),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration:
                BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
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
                title:  Text('Каталог',
                  style: Theme.of(context).textTheme.headline6,
                ),
                //     style:   Theme.of(context).textTheme.headline6,
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

              SwitchListTile(
                title: Text('Тёмная тема'),
                value: _darcTheme,
                onChanged: (val){
                  setState(() {
                    _darcTheme=!_darcTheme;
                    if (_darcTheme == true)
                      ThemeData(
                          colorScheme: ColorScheme.fromSwatch(
                          brightness: Brightness.dark,
                      ));
                    if (_darcTheme == false)
                      ThemeData(
                          colorScheme: ColorScheme.fromSwatch(
                            brightness: Brightness.light,
                          ));


                  });
                },
              ),
            ],
          ),

        ),
        body: Text('Привет', style: Theme.of(context).textTheme.headline6,),
      ),
    );
  }
}
