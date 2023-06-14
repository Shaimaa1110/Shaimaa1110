import 'package:flutter/material.dart';
class StackClass extends StatefulWidget {
  const StackClass({Key? key}) : super(key: key);

  @override
  State<StackClass> createState() => _StackClassState();
}

class _StackClassState extends State<StackClass> {

  @override
  Widget build(BuildContext context) {
    Size size =MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Stack"),
        backgroundColor: Colors.indigoAccent,
      centerTitle: true,
      ),
      body: Stack(
     fit: StackFit.expand,
        children: [
          Material(
            color: Colors.cyan,
          ),
          Positioned(
            top: 0,
            left: 0,
            child: Icon(Icons.account_balance,size: 60,),
          ),
          Positioned(
            top: (size.height-170),
            left: (size.width-170),
            child: Icon(Icons.fitness_center,size: 60,),
          )
        ],
      ),
    );
  }
}
