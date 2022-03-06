import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:async';
import 'dart:io';

class SharPefScreen extends StatelessWidget {
  const SharPefScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Испытываем SharedPreferences',
      home: MyHomePage(title: 'Испытываем SharedPreferences SF', storage: CounterStorage()),
    );
  }
}
//создаем класс в котором будут все методы необходимые для работы с файлом
class CounterStorage {
  //получает каталог файла
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }
  //получает файл из каталога по имени
  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/counter.txt');
  }
  //считывает содержимое файла как строку и переводит его в число
  Future<int> readCounter() async{
    try {
      final file = await _localFile;
      final contents = await file.readAsString();
      return int.parse(contents);
    } catch(e){
      return 0;
    }
  }
  //записывает в файл данные из переменной counter
  Future<File> writeCounter(int counter) async{
    final file = await _localFile;
    return file.writeAsString('$counter');
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title, required this.storage}) : super(key: key);

  final String title;
  final CounterStorage storage;


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter=0;
  int _counter2=0;
  @override
  void initState(){
    super.initState();
    //загрузка ранее сохраненного значения в первый счетчик
    _loadCounter();

    //загрузка ранее сохраненного значения во второй счетчик
    widget.storage.readCounter().then((int value) {
      setState(() {
        _counter2 = value;
      });
    });
  }

//устанавливаем началььное значение счетчика1
  void _loadCounter() async{
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _counter = (prefs.getInt('counter') ?? 0);
    });
  }
//счетчик1 после кликов
  void _incrementCounter() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _counter = (prefs.getInt('counter')?? 0)+1;
      prefs.setInt('counter', _counter);
    });
  }

//счетчик 2 после кликов
  Future<File> _incrementCounter2() {
    setState(() {
      _counter2++;
    });
    return widget.storage.writeCounter(_counter2);
  }



  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Column(
//            mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Счетчик 1'),
                    SizedBox(height: 10,),
                    Text('$_counter', style: Theme.of(context).textTheme.headline4,),
                    SizedBox(height: 150,),
                    FloatingActionButton(
                      onPressed: _incrementCounter,
                      tooltip: 'increment',
                      child: const Icon(Icons.add),
                    ),

                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  children: [
                    const Text('Счетчик 2'),
                    SizedBox(height: 10,),
                    Text('$_counter2', style: Theme.of(context).textTheme.headline4,),
                    SizedBox(height: 150,),
                    FloatingActionButton(
                      onPressed: _incrementCounter2,
                      tooltip: 'increment',
                      child: const Icon(Icons.add),
                    ),

                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //     onPressed: _incrementCounter,
      //   tooltip: 'increment',
      //   child: const Icon(Icons.add),
      // ),
    );
  }
}
