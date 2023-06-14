import 'package:flutter/material.dart';
class SwitchClass extends StatefulWidget {
  const SwitchClass({Key? key}) : super(key: key);

  @override
  State<SwitchClass> createState() => _SwitchClassState();
}

class _SwitchClassState extends State<SwitchClass> {
  bool isOn = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Switch(
          value:isOn ,
          onChanged:(isOnpam){
            setState(() {
              isOn?isOn= false : isOn = true;
            });
          },
          activeColor: Colors.pink,
          inactiveThumbColor: Colors.blue.shade200,
          activeTrackColor: Colors.blue,
        ),
      ),
    );
  }
}
