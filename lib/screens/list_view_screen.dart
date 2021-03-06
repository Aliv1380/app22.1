

import 'package:flutter/material.dart';

class ListViewScreen extends StatelessWidget {
  const ListViewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ClicListBuilder(),
      ),
    );
  }
}
//далее разные варианты формирования спика
// Простой список-------------------------------------
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
//Список контейнеров-------------------------------------------------------

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
//Построитель списка-----------------------------------------------------------
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
//список с разделителями-----------------------------------------------------------------------------
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
//Кликабельный список-----------------------------------------------------
class ClicListBuilder extends StatefulWidget {
  const ClicListBuilder({Key? key}) : super(key: key);
  @override
  _ClicListBuilderState createState() => _ClicListBuilderState();
}
class _ClicListBuilderState extends State<ClicListBuilder> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 20,
      itemBuilder: (BuildContext, int index) {
        return ListTile(
          title: Text('Item $index'),
          onTap: (){
            setState(() {
              _selectedIndex = index;
            });
          },
        );
      }
    );
  }
}

//простой список с иконками ----------------------------------------------
class SimpleListViewIcon extends StatelessWidget {
  const SimpleListViewIcon({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.vertical,
      children: const <Widget>[
        ListTile(
          leading: Icon(Icons.map),
          title: Text('Map'),
        ),
        ListTile(
          leading: Icon(Icons.add_a_photo),
          title: Text('Photo'),
        ),ListTile(
          leading: Icon(Icons.add_call),
          title: Text('Call'),
        ),ListTile(
          leading: Icon(Icons.add_link),
          title: Text('Add link'),
        ),
      ],
    );
  }
}
//-------------------------------------------------------------------

