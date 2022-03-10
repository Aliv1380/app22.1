import 'dart:io';
import 'dart:async';
import 'dart:convert';
import 'package:path_provider/path_provider.dart';

class LogPar {
  String login = "";
  String password = "";
  LogPar({required this.login, required this.password});
  LogPar.FromJson(Map<String, String> json) {
    login = json['login'] ?? "";
    password = json['password'] ?? "";
  }
  Map<String, String> toJson() => {
    'login' : login,
    'password' : password
  };



//получает каталог файла
 static Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }
//получает файл из каталога по имени
 static Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/logPar.json');
  }
//считывает содержимое файла как строку и переводит его в число
  static Future<void> readLogPar() async{
    try {
      final file = await _localFile;
      final contents = await file.readAsString();
      // List jsonResponse = json.decode(contents);
      //return jsonResponse.map((str) => LogPar.fromJson(str)).toList();

    } catch(e){
      // return 0;
      print('Ошибка чтения файла');
    }
  }
//записывает в файл данные из переменной counter
  static Future<File> writeLogPar(int counter) async{
    final file = await _localFile;
    return file.writeAsString('$counter');
  }

}

