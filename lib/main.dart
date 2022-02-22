//import 'dart:js';
import 'dart:ui';

import 'package:app22/app_bar_screen.dart';
import 'package:flutter/material.dart';
import 'calc_screen.dart';
import 'example_radio_switch.dart';
import 'first_screen.dart';
import 'navidation_drawer_screen.dart';
import 'registration_screen.dart';

//RegScreen
//MyApp
//CalcScreen
//ExRadioSwitch
//NavigstionDrawerScreen
//MyAppBar

void main() {
  runApp(
    MaterialApp(
      title: 'Named Routes',
      initialRoute: '/',
      routes: {
        '/':(context)=>MyFirstScreen(),
        '/reg':(context)=>RegScreen(),
        '/calc':(context)=>CalcScreen(),
        '/myAppBar':(context)=>MyAppBar(),
      },
    ),
  );


 // runApp(const MyApp());
}
