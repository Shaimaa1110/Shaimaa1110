
import 'Movie.dart';

class BookTicket{
  int _numOfMovie;


  List<Movie>movieList=[];
  double _total;

  BookTicket() {
    _numOfMovie=0;
    _total=0;
  }


  set total(double value) {
    _total = value;
  }

  double get total => _total; // get venue => _venue;

   get numOfMovie => _numOfMovie;

  set numOfMovie(int value) {
    _numOfMovie = value;
  }
}