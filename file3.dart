import 'dart:convert';

import 'package:flutter/material.dart';
class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("                   Good Food Good Mood       "),
        backgroundColor: Colors.orange.shade200,
      ),
      body: Stack(
        //fit: StackFit.expand,
        children: [
          Container(
            child: Image.asset(
              'asset/food.png',
            //  fit: BoxFit.cover,
            ),
         //   width: MediaQuery.of(context).size.width,
           // height: MediaQuery.of(context).size.width,
          ),
          TextButton.icon(
            label:Text("Menue") ,
            icon:IconData(0xe25a,fontFamily: 'MaterialIcons',
                color: Colors.orange) ,

            child: Text("Menu"),
            onPressed: (){

            },
          ),
         // Positioned(top: 0, left: 0, child: Icon(Icons.MaterialIcons)),

        ],
      ),

    );
  }
}
//0xe25a, fontFamily: 'MaterialIcons'