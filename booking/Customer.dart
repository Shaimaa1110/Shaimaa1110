
import 'dart:io';

import 'BookTicket.dart';
import 'Current_movies.dart';
import 'Functions.dart';
import 'Payment.dart';

var id=0;
class Customer {
  String _name, _address, _phNo;
  int _id;
  BookTicket bookTicket; //object from class book ticket
  Payment payment;

  Customer({String name, String address, String phNo ,String cType ,String cNo, String cPass}) {
    _id = id++;
    bookTicket = BookTicket();
    _name = name;
    _address = address;
    _phNo = phNo;
    payment = Payment(cType, cNo ,cPass);
  }

  String get name => _name;


  viewBookingMovie() {
//user booking
    int size = bookTicket.numOfMovie;
    print("Movie name :     Date:     Time:    Venue:     Price:      ");

    for (int i = 0; i < size; i++) {
       print("${bookTicket.movieList
           .elementAt(i)
           .name}     ${bookTicket.movieList
           .elementAt(i)
           .date}     ${bookTicket.movieList
           .elementAt(i)
           .time}     ${bookTicket.movieList
           .elementAt(i)
           .venue}      ${bookTicket.movieList
           .elementAt(i)
           .price}");
     }
  }

  viewAllMovie() {
    viewMovies();
  }

  addToBookingTicket(int choice) {
    int index = currentMovies.indexWhere((element) => choice == element.id);
    if (index == -1) {
      print("Movie Not Found!");
    }
    else {
      bookTicket.movieList.add(currentMovies.elementAt(index));
      bookTicket.numOfMovie += 1;
      bookTicket.total+=(currentMovies.elementAt(index).price);
    }
  }

  removeFromBookingTicket(int choice) {

      int index = currentMovies.indexWhere((element) => choice == element.id);
      if (index == -1) {
        print("Movie Not Found!");
      }
      else {
        bookTicket.movieList.removeAt(index);
        bookTicket.numOfMovie -= 1;
      bookTicket.total-=(bookTicket.movieList.elementAt(index).price);

    }
  }

  paymentFunction(){
    print("---------------------------------");
    print("Your Tickets Are :");
    viewBookingMovie();
    print("---------------------------------");
    print("Total: ${bookTicket.total}");

  stdout.write("Do you want to complete ? ");
  var choice = stdin.readLineSync();
  if(choice.toLowerCase()=="yes"){
    stdout.write(" Enter your card number ");
    var cNo = stdin.readLineSync();
    stdout.write("Enter your card password");
    var cpass = stdin.readLineSync();
    int result =payment.cardValidation(cNo: cNo , cpass: cpass );
    if(result==0){
      print("Wrong Card Password! Try Again ");
    }
    else  if(result==2)
    {
      print("Wrong Card Number ! Try Again ");
    }
    else{
      print("Process Finish ");
    }
  }
  else{
     n=0;
  }
  }

  get address => _address;

  get phNo => _phNo;
}
