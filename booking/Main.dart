
import 'dart:io';

import 'Customer.dart';
import 'Functions.dart';





void main() {

  Functions object = Functions();
  print("Welcome\nIf you are admin enter => 1\nIf you are guest enter => 2");
  int choice=num.parse(stdin.readLineSync());
  if(choice==1){
    stdout.write("Enter your Name:");
    var name =stdin.readLineSync();

    stdout.write("Enter your Id:");
    var id =stdin.readLineSync();
    object.runAdminMode(name,id);

  }
  else{
    object.runGuestMode();
  }
}

