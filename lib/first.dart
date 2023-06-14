import 'package:flutter/material.dart';
class TextPage extends StatefulWidget {
  const TextPage({Key? key}) : super(key: key);

  @override
  State<TextPage> createState() => _TextPageState();
}

class _TextPageState extends State<TextPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shaimaa"),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.width,
        color: Colors.black12,
        child: Text("Control every pixel to create customized & adaptive designs that look great on any screen. Take control of your codebase with plugins, testing, dev tools & build high quality apps. Native Performance. Null Safe Code. Hot Reload. Web Stable. Multi-Platform",
          textAlign: TextAlign.justify,
        style: TextStyle(
          fontWeight: FontWeight.w300,
            fontSize: 25,
          fontStyle: FontStyle.normal,
            color: Colors.lightBlue,
            decoration: TextDecoration.underline,
          decorationColor: Colors.red,
          decorationStyle: TextDecorationStyle.dotted,
          backgroundColor: Colors.white,
          letterSpacing: 10,
        ),
        ),

      ),
    );
  }
}
