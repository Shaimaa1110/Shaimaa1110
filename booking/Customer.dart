
import 'BookTicket.dart';
import 'Current_movies.dart';

var id=0;
class Customer {
  String _name, _address, _phNo;
  int _id;
  BookTicket bookTicket; //object from class book ticket

  Customer({String name, String address, String phNo}) {
    _id = id++;
    bookTicket = BookTicket();
    _name = name;
    _address = address;
    _phNo = phNo;
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

  payment(){
    print("---------------------------------");
    print("Your Tickets Are :");
    viewBookingMovie();
    print("---------------------------------");
    print("Total: ${bookTicket.total}");
  }

  get address => _address;

  get phNo => _phNo;
}
