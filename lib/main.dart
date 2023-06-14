import 'package:flutter/material.dart';
import 'package:untitled1/my_router.dart';
import 'package:untitled1/page1.dart';
import 'package:untitled1/stack.dart';

import 'Switch.dart';
import 'file2.dart';
import 'first.dart';
import 'homePage.dart';
import 'new_class.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      initialRoute: HomePage,
      onGenerateRoute: MyRouter.generatrRoutes,
      debugShowCheckedModeBanner: false,
    );
  }
}


