
import 'package:app22/utils/global_theme.dart';
import 'package:flutter/material.dart';

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

const myTextStile = TextStyle(
    fontSize: 16,
    color: Color(0xFFC4C4C4)
);

class RegScreen extends StatelessWidget {
  const RegScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: globalTheme(),
      home: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 50, vertical: 60),
            child: Center(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                        const Icon(IconData(0xeb7e, fontFamily: 'MaterialIcons')),
                        Container(
                            //height: 17,
                            child: Text("Регистрация", style: TextStyle(fontSize: 20),)
                        ),
                      ],
                    ),

                  SizedBox(height: 20,),
                  const Text(
                    "Чтобы зарегистрироваться, введите свой номер телефона и почту",
                    textAlign: TextAlign.center, style: myTextStile,),

                  SizedBox(height: 20,),
                  Text("Телефон"),

                  const TextField(decoration:
                  InputDecoration(filled: true, fillColor: Color(0xFFECEFF1),
                    focusedBorder: borderStyle,
                    enabledBorder: borderStyle,
                    //labelText: 'Телефон',
                  ),
                    keyboardType: TextInputType.phone,
                  ),
                  SizedBox(height: 20,),

                  Text("Почта"),

                  const TextField(obscureText: true, decoration:
                  InputDecoration(filled: true, fillColor: Color(0xFFECEFF1),
                    focusedBorder: borderStyle,
                    enabledBorder: borderStyle,
                  ),
                    keyboardType: TextInputType.text,
                  ),

                  SizedBox(height: 20,),
                  const Text(
                    "Вам придет четырехзначный код, который будет вашим паролем",
                    textAlign: TextAlign.center, style: myTextStile,),

                  SizedBox(height: 20,),
                  const Text(
                    "Изменить пароль можно будет в личном кабинете после регистрации",
                    textAlign: TextAlign.center,style: myTextStile,),

                  SizedBox(height: 42,),

                  SizedBox(
                    width: 154, height: 42,
                    child:  ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/calc');
                      },
                    child: Text('Войти'),
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFF0079D0),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius
                          .circular(36),),
                     ),
                    )
                  ),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}