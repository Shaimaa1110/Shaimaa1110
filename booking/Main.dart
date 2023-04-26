
import 'dart:io';

import 'Customer.dart';
import 'dart:io';

Customer createAccount(){

   stdout.write("Enter Your Name : ");
   String name = stdin.readLineSync();

   stdout.write("Enter Your Address : ");
   String address = stdin.readLineSync();

   stdout.write("Enter Your Phone number : ");
   String phNo = stdin.readLineSync();
   return Customer(name: name, address: address,phNo: phNo);

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

pickChoice(Customer customer){

   stdout.write("Pick a choice : ");
      int choice = num.parse(stdin.readLineSync());

      switch(choice){
         case 1 :
         viewMenu();
         print("***************************");
         break;
         // case 2 :
         //   print("$customer");
         //    customer = createAccount();
         //
         // print("***************************");
         // break;
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
           customer.payment();
           print("***************************");
           break;
      }
   }


runUserMode(){
  print("Welcome , First you need to create an account :");
  String s =stdin.readLineSync();
  if(s.toLowerCase()=="yes"){
print("_________________________________");
   Customer customer =createAccount();
   viewMenu();
   while(true) {
      pickChoice(customer);
   }
  }
   else {
    print("~ Guest Mood ~");
  }
 }

void main(){

   // Customer customer = createAccount();
   // viewMenu();

//  customer.viewAllMovie();
//  print(customer.bookTicket.movieList.length);
//
//
// customer.addToBookingTicket(1);
//
// if(customer.bookTicket.movieList.isEmpty) {
//    customer.viewBookingMovie();
//
// }
// print(customer.bookTicket.movieList.length);
runUserMode();
}
