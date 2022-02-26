import 'package:flutter/material.dart';

class ExRadioSwitch extends StatefulWidget {
  const ExRadioSwitch({Key? key}) : super(key: key);

  @override
  _ExRadioSwitchState createState() => _ExRadioSwitchState();
}

enum SkillLevel{junior, middle, senior}

class _ExRadioSwitchState extends State<ExRadioSwitch> {
  bool _checked= false;
  bool _confirmAgreement = true;
  SkillLevel? _skillLevel = SkillLevel.junior;

  void _checkedChange (bool? val){
    setState(() {
      _checked=!_checked;
    });
  }
  void _onSkillLevelChanged(SkillLevel? value){
    setState(() {
      _skillLevel = value;
    });
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(),
            body: SingleChildScrollView(
                child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: Center(
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Checkbox(value: _checked, onChanged: _checkedChange),
                                Text('Установлено')
                              ],
                            ),
                            CheckboxListTile(
                                title: Text('Принять условие'),
                                value: _confirmAgreement,
                                onChanged: (val){
                                  setState(() {
                                    _confirmAgreement=!_confirmAgreement;
                                  });
                                }),
                            Row(
                              children: [
                                Switch(
                                    value: _checked,
                                    onChanged: _checkedChange),
                                const Text('Установлено'),
                              ],
                            ),
                            SwitchListTile(
                              value: _checked,
                              onChanged: _checkedChange,
                              title: Text('Установлено'),
                            ),
                            RadioListTile<SkillLevel>(
                                title: const Text('junior'),
                                value: SkillLevel.junior,
                                groupValue: _skillLevel,
                                onChanged: (SkillLevel? value){
                                  setState(() {
                                    _skillLevel = value;
                                  });
                                }
                            ),
                            RadioListTile<SkillLevel>(
                                title: const Text('middle'),
                                value: SkillLevel.middle,
                                groupValue: _skillLevel,
                                onChanged: _onSkillLevelChanged
                            ),
                            RadioListTile<SkillLevel>(
                                title: const Text('senior'),
                                value: SkillLevel.senior,
                                groupValue: _skillLevel,
                                onChanged: _onSkillLevelChanged
                            ),
                          ],

                        )
                    )
                )
            )
        )
    );
  }
}