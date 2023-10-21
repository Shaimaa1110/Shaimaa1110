import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test2/Final_Project/View/Screens/Auth/sign_in.dart';
import 'package:test2/Final_Project/View/Screens/Auth/sign_up.dart';
import 'package:test2/Final_Project/View/Screens/Auth/welcom.splash.dart';
import 'Final_Project/Provider/location.dart';
import 'Final_Project/View/Components/cart1.dart';
import 'Final_Project/View/Screens/Cars_Types/pages_cars.dart';
import 'Final_Project/View/Screens/Home/car_types.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MultiProvider(
      // Use MultiProvider to wrap multiple providers
      providers: [
        ChangeNotifierProvider<Cart>(create: (context) => Cart()),

        // Add Cart2 provider
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    FirebaseAuth.instance
        .authStateChanges()
        .listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        print('User is signed in!');
      }
    });
    super.initState();
  }
  @override

  Widget build(BuildContext context) {
    return MaterialApp(

      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        //primarySwatch: Colors.red,
      ),
      home: SplashScreen(),
      routes: {
        "signUp":(context)=>SignUp(),
        "logein":(context)=>SignIn(),
        "homepage":(context)=>SplashScreen(),

      },
    );
  }
}