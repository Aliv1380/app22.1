

import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //borderStyle - используется для задания скрудлений границ полей ввода текста в myTextFieldDecoration
    const borderStyle = OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        borderSide: BorderSide(color: Color(0xFFeceff1))
    );
    // myTextFieldDecoration - задает оформление поля ввода текста
    const myTextFieldDecoration = InputDecoration(filled: true,
      fillColor: Color(0xFFECEFF1),
      focusedBorder: borderStyle,
      enabledBorder: borderStyle,
    );

    // myInkWellTextStyle - задает стиль для ссылок
    const myInkWellTextStyle = TextStyle(
      fontSize:18,
      color: Color(0xFF0079D0),
      fontWeight: FontWeight.bold,
    );

    return MaterialApp(
      home: Scaffold(body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/fon.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        padding: EdgeInsets.symmetric(horizontal: 50),
        child: Center(
          child: SingleChildScrollView(   //делает экран прогручиваемым (чтобы небыло пробития дна экрана)
            child: Column(children:  [
              SizedBox(height: 50,),
              const SizedBox(width: 110,height:84 ,child: Image(image: AssetImage('assets/logo.png')),),
              SizedBox(height: 20,),
              Text('Введите логин в виде 10 цифр номера телефона',
                style: TextStyle(fontSize:16, color: Color.fromRGBO(0, 0, 0, 0.6)),),
              SizedBox(height: 20,),



              TextField(decoration:
              InputDecoration(filled: true, fillColor: Color(0xFFECEFF1),
                focusedBorder: borderStyle,
                enabledBorder: borderStyle,
                labelText: 'Логин',
              ),
                keyboardType: TextInputType.phone,
              ),
              SizedBox(height: 30,),

              TextField(obscureText: true, decoration:
              InputDecoration(filled: true, fillColor: Color(0xFFECEFF1),
                focusedBorder: borderStyle,
                enabledBorder: borderStyle,
                labelText: 'Пароль',
              ),
                keyboardType: TextInputType.text,
              ),



              SizedBox(height: 30,),

              SizedBox(width: 154, height: 42, child:
              ElevatedButton(onPressed: (){}, child:
              Text('Войти'),
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFF0079D0),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(36),),
                ),
              )
              ),
              SizedBox(height: 75,),
              InkWell(child:
              const Text('Регистрация',style: myInkWellTextStyle,),
                onTap: () {},
              ),
              SizedBox(height: 20,),
              InkWell(child:
              const Text('Забыли пароль?', style: myInkWellTextStyle,),
                onTap: () {},
              ),
            ],),
          ),
        ),
      ),),
    );
  }
}