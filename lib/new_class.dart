import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
class ImageClass extends StatefulWidget {
  const ImageClass({Key? key}) : super(key: key);

  @override
  State<ImageClass> createState() => _ImageClassState();
}

class _ImageClassState extends State<ImageClass> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    //  appBar: AppBar(
        //title: Text(""),
     // ),
      body: Center(

        child: Image.asset('asstes/icons8-flutter-24.png',
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.blueAccent,
        fit: BoxFit.cover,),
      ),
    );
  }
}
