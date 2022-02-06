import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

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
      fillColor: Color(0xFFeceff1), labelText: 'Телефон',
      focusedBorder: borderStyle,
      enabledBorder: borderStyle,
    );

    // myInkWellTextStyle - задает стиль для ссылок
    const myInkWellTextStyle = TextStyle(fontSize:16, color: Color(0xFF0079D0));

    //Почему то не сработало, надо разобраться. Возможно тут ссылка на сам объект
    // const myStyleElevatedButton = ElevatedButton.styleFrom(
       // primary: Color(0xFF0079D0),
       //shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(36),),
    //);

    return MaterialApp(
      home: Scaffold(body: Center(
        child: Column(children:  [
          SizedBox(height: 60,),
          SizedBox(width: 110,height:84 ,child: Placeholder(),),
          SizedBox(height: 20,),
          Text('Введите логин в виде 10 цифр номера телефона',
            style: TextStyle(fontSize:16, color: Color.fromRGBO(0, 0, 0, 0.6)),),
          SizedBox(height: 20,),
          const SizedBox(width: 224, height: 34,
            child: TextField(decoration: myTextFieldDecoration,)
          ),
          SizedBox(height: 20,),
          const SizedBox(width: 224, height: 34,
            child: TextField(obscureText: true, decoration: myTextFieldDecoration,),
          ),

          SizedBox(height: 20,),

          SizedBox(width: 154, height: 42, child:
            ElevatedButton(onPressed: (){}, child:
              Text('Войти'),
              style: ElevatedButton.styleFrom(
                primary: Color(0xFF0079D0),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(36),),
              ),
            )
          ),


          SizedBox(height: 62,),

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
      ),),
    );
  }
}
