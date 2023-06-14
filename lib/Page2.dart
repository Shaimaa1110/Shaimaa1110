import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled1/first.dart';
class Page2 extends StatefulWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Page2"),
        backgroundColor: Colors.teal,
      ),

      body: Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text("page 2"),
          ElevatedButton(onPressed: (){
            Navigator.of(context).pop();
          }, child: Text("Page1"),
            style: ButtonStyle(backgroundColor:MaterialStateProperty.all(Colors.teal)),),
        ],
      ),),
    );
  }
}
