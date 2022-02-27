

import 'package:flutter/material.dart';

class ListViewScreen extends StatelessWidget {
  const ListViewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SimpleListSeparated(),
      ),
    );
  }
}

class SimpleList extends StatelessWidget {
  const SimpleList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.vertical,
      children: [
        Text('111'),
        Text('222'),
        Text('333'),
        Text('444'),
        Text('555'),
        MyListItem(number: 1),
        MyListItem(number: 1),
        MyListItem(number: 1),
        MyListItem(number: 1),
        MyListItem(number: 1),
        MyListItem(number: 1),
        MyListItem(number: 1),
        MyListItem(number: 1),
     ],
    );
  }
}



class MyListItem extends StatelessWidget {
  const MyListItem({Key? key, required this.number}) : super(key: key);
  final int number;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.lightBlueAccent,
        border: Border.all(),
      ),
      child: Text('Элемент № $number',
      style: Theme.of(context).textTheme.headline6,
      ),

    );
  }
}

class SimpleListBuilder extends StatelessWidget {
  SimpleListBuilder({Key? key}) : super(key: key);
  var list = List<int>.generate(50, (i) => i+1);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: EdgeInsets.all(8),
        itemCount: 30,

        itemBuilder: (BuildContext context, int index){
          return MyListItem(number: index);
        }

    );
  }
}

class SimpleListSeparated extends StatelessWidget {
  SimpleListSeparated({Key? key}) : super(key: key);
  var list = List<int>.generate(50, (i) => i+1);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        padding: EdgeInsets.all(8),
        itemCount: list.length,

        itemBuilder: (BuildContext context, int index){
          return MyListItem(number: index);
        },
      separatorBuilder: (BuildContext context, int index)=>Divider(thickness: 3,),

    );
  }
}