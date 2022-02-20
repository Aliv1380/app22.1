import 'package:flutter/material.dart';
import 'package:sliding_switch/sliding_switch.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class CalcScreen extends StatefulWidget {
  const CalcScreen({Key? key}) : super(key: key);

  @override
  _CalcScreenState createState() => _CalcScreenState();
}

enum Sause {hot, sweet, cheese}

class _CalcScreenState extends State<CalcScreen> {
  bool _isSlim = true;
  double _pizzaSize = 40;
  int _cost = 200;
  Sause? _sause= Sause.cheese;
  bool _addCheese = false;

  int _calcCost() {
    _cost = _pizzaSize.round()*5;
    if (_isSlim == false) _cost=_cost-20;
    if (_addCheese==true) _cost+=40;

    switch (_sause) {
      case Sause.hot: _cost+=20;
        break;
      case Sause.sweet: _cost+=30;
        break;
      case Sause.cheese: _cost+=40;
        break;
      default: _sause= Sause.cheese;
        break;
    }
    return _cost;
  }
  void _onSauseChanged(Sause? value){
    setState(() {
      _sause = value;
      _calcCost();
    });
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 5,),
            child: Center(
              child: Column(
                children: [
                  Row(mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const SizedBox(width: 232,height:123 ,child: Image(image: AssetImage('assets/pizza.png')),),
                    ],
                  ),
                  SizedBox(height: 30,),
                  Text('Калькулятор пиццы',style: TextStyle(fontSize: 30)),
                  SizedBox(height: 9,),
                  Text('Выберите параметры',style: TextStyle(fontSize: 19)),
                  SizedBox(height: 40,),

                  SlidingSwitch(
                    value: _isSlim,
                    width: 300,
                    onChanged: (bool value) {
                      setState(() {
                        _isSlim=value;
                        _calcCost();
                      });

                    },
                    height : 34,
                    animationDuration : const Duration(milliseconds: 400),
                    onTap:(){},
                    onDoubleTap:(){},
                    onSwipe:(){},
                    textOff : "Обычное тесто",
                    textOn : "Тонкое тесто",
                    colorOn : const Color(0xffFFFFFF),
                    colorOff : const Color(0xffFFFFFF),
                    background : const Color(0xfff7f5f7),
                    buttonColor : const Color(0xff0079D0),
                    inactiveColor : const Color.fromRGBO(0, 0, 0, 0.4),
                  ),

                  //SizedBox(height: 27,),

                  Container(
                    padding: const EdgeInsets.fromLTRB(20, 27, 20, 5),
                    alignment: Alignment.centerLeft,
                      child: Text("Размер",style: TextStyle(fontSize: 18),)),

                  //SizedBox(height: 5,),

                  SfSlider(
                    min: 20,
                    max: 60,
                    value: _pizzaSize,
                    interval: 20,
                    stepSize: 20,
                    showTicks: true,
                    showLabels: true,
                    enableTooltip: false,
                    minorTicksPerInterval: 0,
                    onChanged: (dynamic value){
                      setState(() {
                        _pizzaSize = value;
                        _calcCost();
                      });
                    },
                  ),



                  SizedBox(height: 9,),
                  Text('Соус:'),
                  RadioListTile<Sause>(
                      title: const Text('Острый'),
                      value: Sause.hot,
                      groupValue: _sause,
                      onChanged: _onSauseChanged,
                      visualDensity: const VisualDensity(horizontal: 0, vertical: -4),
                  ),
                  RadioListTile<Sause>(
                      title: const Text('Кисло-сладкий'),
                      value: Sause.sweet,
                      groupValue: _sause,
                      onChanged: _onSauseChanged,
                      visualDensity: const VisualDensity(horizontal: 0, vertical: -4),
                  ),
                  RadioListTile<Sause>(
                      title: const Text('Сырный'),
                      value: Sause.cheese,
                      groupValue: _sause,
                      onChanged: _onSauseChanged,
                      visualDensity: const VisualDensity(horizontal: 0, vertical: -4),
                  ),
                  SizedBox(height: 18,),
                  SizedBox(
                    width: 291,
                    height: 56,
                    child: Card(
                      color: Color(0xFFFF0F0F0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),

                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: const SizedBox(width: 36,height:34 ,child: Image(image: AssetImage('assets/cheez.png')),),
                          ),
                          Text('Дополнительный сыр'),
                          Switch(
                            value: _addCheese,
                            onChanged: (val) {
                              setState(() {
                                _addCheese=!_addCheese;
                                _calcCost();
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(height: 10,),
                  Container(
                    padding: const EdgeInsets.all(20.0),
                    alignment: Alignment.centerLeft,
                    child: Text('Стоимость',style: TextStyle(fontSize: 18))
                  ),
                  SizedBox(height: 9,),
                  SizedBox(
                    height: 34,
                    width: 300,
                    child: Card(
                      color: Color(0xFFFF0F0F0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(36),
                      ),

                      child: Center(child: Text('${_calcCost()} рублей')),
                    ),
                  ),
                  SizedBox(height: 44),

                  SizedBox(
                      width: 154, height: 42,
                      child: ElevatedButton(
                        onPressed: (){},
                        child: Text('Заказать'),
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xFF0079D0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(36),
                          ),
                        ),
                      )
                    ),
                  SizedBox(height: 44),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}