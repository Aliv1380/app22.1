//import 'dart:js';
import 'dart:ui';
import 'package:app22/screens/error_screen.dart';
import 'package:app22/screens/list_view_screen.dart';
import 'package:app22/screens/network_screen.dart';
import 'package:app22/screens/shared_preferences_screen.dart';
import 'package:app22/screens/user_tasks.dart';
import 'package:app22/screens/users_list_screen.dart';
import 'package:flutter/material.dart';

//import 'package:app22/screens/registration_screen.dart';
import 'package:app22/screens/app_bar_screen.dart';
import 'screens/calc_screen.dart';
import 'screens/example_radio_switch.dart';
import 'screens/first_screen.dart';
import 'screens/navidation_drawer_screen.dart';
import 'screens/registration_screen.dart';


void main() {
  runApp(
      MaterialApp(
        title: 'Named Routes',
        initialRoute: '/',
        routes: {
          '/':(context)=>MyFirstScreen(),
          '/users_list':(context)=>UsersListScreen(),
          '/reg':(context)=>RegScreen(),
          '/login_error':(context) => ErrorScreen(),
          '/nav_dro':(context) => NavigstionDrawerScreen(),

  //        '/tasks':(context)=>UserTasksScreen(),
        },
      )
  );
}

    // MaterialApp(
    //   title: 'Named Routes',
    //   initialRoute: '/',
    //   routes: {
    //     '/':(context)=>MyFirstScreen(),
    //     '/reg':(context)=>RegScreen(),
    //     '/calc':(context)=>CalcScreen(),
    //     '/myAppBar':(context)=>MyAppBarScreen(),
    //   },
    // ),



  //ListViewScreen
  //   NetworkScreen()
  // runApp(const MyApp());
  // RegScreen
  //MyApp
  //CalcScreen
  //ExRadioSwitch
  //NavigstionDrawerScreen
  //MyAppBar




//
// import 'package:flutter/material.dart';
//
// void main() => runApp(const MyApp());
//
// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       routes: {
//         ExtractArgumentsScreen.routeName: (context) =>
//         const ExtractArgumentsScreen(),
//       },
//       onGenerateRoute: (settings) {
//         if (settings.name == PassArgumentsScreen.routeName) {
//           final args = settings.arguments as ScreenArguments;
//           return MaterialPageRoute(
//             builder: (context) {
//               return PassArgumentsScreen(
//                 title: args.title,
//                 message: args.message,
//               );
//             },
//           );
//         }
//         assert(false, 'Need to implement ${settings.name}');
//         return null;
//       },
//       title: 'Navigation with Arguments',
//       home: const UsersListScreen(),
//       //UsersListScreen
//     );
//   }
// }
//
// class HomeScreen extends StatelessWidget {
//   const HomeScreen({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Home Screen'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.pushNamed(
//                   context,
//                   ExtractArgumentsScreen.routeName,
//                   arguments: ScreenArguments(
//                     'Extract Arguments Screen',
//                     'This message is extracted in the build method.',
//                   ),
//                 );
//               },
//               child: const Text('Navigate to screen that extracts arguments'),
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.pushNamed(
//                   context,
//                   PassArgumentsScreen.routeName,
//                   arguments: ScreenArguments(
//                     'Accept Arguments Screen',
//                     'This message is extracted in the onGenerateRoute '
//                         'function.',
//                   ),
//                 );
//               },
//               child: const Text('Navigate to a named that accepts arguments'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class ExtractArgumentsScreen extends StatelessWidget {
//   const ExtractArgumentsScreen({Key? key}) : super(key: key);
//   static const routeName = '/extractArguments';
//   @override
//   Widget build(BuildContext context) {
//     final args = ModalRoute.of(context)!.settings.arguments as ScreenArguments;
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(args.title),
//       ),
//       body: Center(
//         child: Text(args.message),
//       ),
//     );
//   }
// }
//
// class PassArgumentsScreen extends StatelessWidget {
//   static const routeName = '/passArguments';
//   final String title;
//   final String message;
//   const PassArgumentsScreen({
//     Key? key,
//     required this.title,
//     required this.message,
//   }) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(title),
//       ),
//       body: Center(
//         child: Text(message),
//       ),
//     );
//   }
// }
//
// class ScreenArguments {
//   final String title;
//   final String message;
//   ScreenArguments(this.title, this.message);
// }