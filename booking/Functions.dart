
import 'AdminIstrator.dart';
import 'Current_movies.dart';
import 'Customer.dart';
import 'dart:io';

import 'Movie.dart';
import 'Static_Data.dart';

var n =0;
var guest =true;
var admin = true;

class Functions{

  runUserMode(){


    Customer customer =createAccount();
    viewMenu();
    while(n==0) {
      pickChoice(customer);
    }
    if(n==1){
      //pay
    }
    else{
      print("Good Bey");
    }
  }

  runGuestMode(){
    viewMenuGuest();

    while(guest) {
      pickChoiceGuest();
    }

  }

  runAdminMode(String name,String id) {
    if (name == administrator.name && id == administrator.id) {
      viewMenuAdmin();
      while (admin) {
        pickChoiceAdmin(Administrator(id, name));
      }
    }
    else{
      print("Wrong Name or Id");
    }
  }


  Customer createAccount(){

    stdout.write("Enter Your Name : ");
    String name = stdin.readLineSync();

    stdout.write("Enter Your Address : ");
    String address = stdin.readLineSync();

    stdout.write("Enter Your Phone number : ");
    String phNo = stdin.readLineSync();

    stdout.write("Enter Your Card Type : ");
    String cType = stdin.readLineSync();

    stdout.write("Enter Your Card number : ");
    String cNo = stdin.readLineSync();

    stdout.write("Enter Your card Password : ");
    String cpass = stdin.readLineSync();
    return Customer(name: name, address: address,phNo: phNo,cType: cType , cNo: cNo , cPass: cpass );

  }

  viewMenu() {
    List<String> choices = [
      "view menu",
      "Currently existing movie : ",
      "Booking tickets",
      "Cancellation booking",
      "Pay",
      "Exist",
    ];


    for (int i = 0; i < choices.length; i++) {
      print("${i + 1}- ${choices.elementAt(i)} ");
    }
  }

  viewMenuGuest() {
    List<String> choices = [
      "view menu",
      "Currently existing movie : ",
      "Crate an account",
      "Exist",
    ];


    for (int i = 0; i < choices.length; i++) {
      print("${i + 1}- ${choices.elementAt(i)} ");
    }
  }


  pickChoice(Customer customer){

    stdout.write("Pick a choice : ");
    int choice = num.parse(stdin.readLineSync());

    switch(choice){
      case 1 :
        viewMenu();
        print("***************************");
        break;

      case 2 :
      //print("${customer.name}");
        if(customer == null) {
          print("Pleas Create An Account First");

        }
        else{
          customer.viewAllMovie();
        }
        print("***************************");
        break;
      case 3 :
        int item;
        do{
          print("* Enter -1 to Stop *");
          stdout.write("Pick movie");
          item = num.parse(stdin.readLineSync());
          if(item!=-1) {
            customer.addToBookingTicket(item);
          }
        }while(item!=-1);
        print("***************************");
        break;
      case 4 :
        int item;
        do{
          if(customer.bookTicket.movieList.isEmpty){
            print("* Your Booking is empty *");
            break;
          }
          print("* Enter -1 to Stop *");
          stdout.write("What movie you want to remove : ");
          item = num.parse(stdin.readLineSync());

          if(item!=-1) {
            customer.removeFromBookingTicket(item);
          }
        }while(item!=-1);
        print("***************************");
        break;
      case 5 :
        n=1;
        customer.paymentFunction();
        print("***************************");
        break;
      case 6 :
        n=2;
    }
  }

  pickChoiceGuest(){
    viewMenuGuest() {
      List<String> choices = [
        "view menu",
        "Currently existing movie : ",
        "Crate an account",
        "Exist",
      ];


      for (int i = 0; i < choices.length; i++) {
        print("${i + 1}- ${choices.elementAt(i)} ");
      }
    }
    stdout.write("Pick a choice : ");
    int choice = num.parse(stdin.readLineSync());

    switch(choice){
      case 1 :
        viewMenuGuest();
        print("***************************");
        break;

      case 2 :
        viewMovies();
        print("***************************");
        break;
      case 3 :
        guest=false;
        runUserMode();
        break;
    }
  }

  viewMenuAdmin() {
    List<String> choices = [
      "view menu",
      "Currently existing movie : ",
      "Add Movies",
      "Delete Movies",
      //"Update Movies",
      "Exist",
    ];


    for (int i = 0; i < choices.length; i++) {
      print("${i + 1}- ${choices.elementAt(i)} ");
    }
  }

  pickChoiceAdmin(Administrator administratorObject){

    stdout.write("Pick a choice : ");
    int choice = num.parse(stdin.readLineSync());

    switch(choice) {
      case 1 :
        viewMenuAdmin();
        print("***************************");
        break;

      case 2 :
        viewMovies();
        print("***************************");
        break;
      case 3 :
        stdout.write("Enter Movie Name: ");
        var name = stdin.readLineSync();

        stdout.write("Enter Movie Price: ");
        double price = num.parse(stdin.readLineSync()).toDouble();

        stdout.write("Enter Movie Time: ");
        var time = stdin.readLineSync();

        stdout.write("Enter Movie Date: ");
        var date = stdin.readLineSync();

        stdout.write("Enter Movie Venue: ");
        var venue = stdin.readLineSync();

        Movie movie = Movie(
            n: name,
            p: price,
            t: time,
            d: date,
            v: venue);

        administrator.addMovies(movie);
        break;
      case 4:
        stdout.write("Enter Movie Id: ");
        String id = stdin.readLineSync();
        print(administratorObject.deleteMovies(id));
        break;


      case 5 :
        print("Thanks");


          }
        }
   }