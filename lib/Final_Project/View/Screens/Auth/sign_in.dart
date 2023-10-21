import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:test2/Final_Project/View/Screens/Auth/sign_up.dart';

import '../../Components/registeration.dart';
import '../../Components/text_field_widget.dart';





class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  final FirebaseAuth credential= FirebaseAuth.instance;
  void addAccount()async {

    try {
      await credential.createUserWithEmailAndPassword(
        email: email.text,
        password: password.text,
      ).whenComplete((){
        log(email.text);
        log(password.text);


        Navigator.of(context).pushReplacementNamed("homepage");
      });


    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Sign in",
                              style: TextStyle(
                                  fontSize: 35, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),

                        SizedBox(
                          height: 20,
                        ),

                        Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              TextFormFieldWidget(
                                labelText: 'Email',
                                hintText: 'name@gmail.com',
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your email';
                                  }
                                  if (!value.contains('@')) {
                                    return 'Please enter a valid email';
                                  }
                                  return null;
                                },
                                onSaved: (value) {
                                  email.text = value!;
                                }, controller: email,
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              TextFormFieldWidget(
                                labelText: 'password',
                                hintText: '*******',
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your pass';
                                  }

                                  return null;
                                },
                                onSaved: (value) {
                                  password.text = value!;
                                }, controller:password,
                              ),
                            ],
                          ),
                        ),
                        // Form Ends Here
                        SizedBox(
                          height: 20,
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {},
                            child: Text(
                              "Forgot Password?",
                              style: TextStyle(color: Colors.red.shade900),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          height: 50,
                          width: 300,
                          child: RegButton(
                            text: "Sign In",

                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                _formKey.currentState!.save();
                                log("Email: ${email.text}, Password: ${password.text}");
                                addAccount();
                              }
                            },
                          ),
                        ),


                        SizedBox(
                          height: 30,
                        ),
                        AuthButton(
                          text: "Sign In with Facebook",
                          imagePath:
                          "https://upload.wikimedia.org/wikipedia/commons/thumb/b/b8/2021_Facebook_icon.svg/800px-2021_Facebook_icon.svg.png", onPressed: () {  },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        AuthButton(
                          text: "Sign In with Google",
                          imagePath:
                          "https://upload.wikimedia.org/wikipedia/commons/thumb/5/53/Google_%22G%22_Logo.svg/706px-Google_%22G%22_Logo.svg.png", onPressed: () {  },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Don\'t have an account? '),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SignUp(),
                                  ),
                                );
                              },
                              child: Text(
                                'Sign Up',
                                style: TextStyle(
                                  color: Colors.red.shade900,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}