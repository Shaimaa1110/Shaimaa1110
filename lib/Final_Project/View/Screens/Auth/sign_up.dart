import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:test2/Final_Project/View/Screens/Auth/sign_in.dart';
import '../../Components/registeration.dart';
import '../../Components/text_field_widget.dart';
import '../Account/countries.dart';
import '../Account/guest.dart';
import '../Home/car_types.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  Country selectedCountry = countries[0];
  final FirebaseAuth credential = FirebaseAuth.instance;

  void addAccount() async {
    try {
      await credential.createUserWithEmailAndPassword(
        email: email.text,
        password: password.text,
      ).whenComplete(() {
        log(email.text);
        log(password.text);


        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => CarsTypes(),
          ),
        );
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
            child: Container(
              height: 600,
              width: MediaQuery.of(context).size.width,
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Row(
                          children: [
                            Text(
                              "Sign Up",
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              TextFormFieldWidget(
                                labelText: 'Name',
                                hintText: 'Your Name',
                                controller: username,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your name';
                                  }
                                  return null;
                                },
                                onSaved: (value) {
                                  username.text = value!;
                                },
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              TextFormFieldWidget(
                                labelText: 'Email',
                                hintText: 'name@gmail.com',
                                controller: email,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your email';
                                  }
                                  if (!emailValidation(value)) {
                                    return 'Please enter a valid email';
                                  }
                                  return null;
                                },
                                onSaved: (value) {
                                  email.text = value!;
                                },
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              TextFormFieldWidget(
                                labelText: 'Password',
                                hintText: '********',
                                controller: password,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your password';
                                  }
                                  return null;
                                },
                                onSaved: (value) {
                                  password.text = value!;
                                },
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                children: [
                                  Container(
                                    width: 100,
                                    child: DropdownButtonFormField<Country>(
                                      value: selectedCountry,
                                      onChanged: (Country? newValue) {
                                        setState(() {
                                          selectedCountry = newValue!;
                                        });
                                      },
                                      items: countries
                                          .map<DropdownMenuItem<Country>>(
                                              (Country country) {
                                            return DropdownMenuItem<Country>(
                                              value: country,
                                              child: Row(
                                                children: [
                                                  Text('${country.flag} ${country.code}'),
                                                ],
                                              ),
                                            );
                                          }).toList(),
                                    ),
                                  ),
                                  SizedBox(width: 20),
                                  Expanded(
                                    child: TextFormFieldWidget(
                                      labelText: 'Phone Number',
                                      hintText: '123-456-789',
                                      controller: phoneNumber,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please enter your phone number';
                                        }
                                        return null;
                                      },
                                      onSaved: (value) {
                                        phoneNumber.text = value!;
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              SizedBox(
                                height: 50,
                                width: 300,
                                child: RegButton(
                                  text: "Sign Up",
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      _formKey.currentState!.save();
                                      addAccount();
                                    }
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('If you have an account? '),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SignIn(),
                                  ),
                                );
                              },
                              child: Text(
                                'Sign In',
                                style: TextStyle(
                                  color: Colors.red.shade900,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => GuestHome(),
                              ),
                            );
                          },
                          child: Text(
                            'Login as a guest',
                            style: TextStyle(
                              color: Colors.red.shade900,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

bool emailValidation(String email) {
  return RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
      .hasMatch(email);
}
