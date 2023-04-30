
import 'Current_movies.dart';
import 'Movie.dart';


class Administrator{

  String  _id,_name;

  Administrator(this._id, this._name);

  get name => _name;

  String get id => _id;

  void adminViewMovies(){
    viewMovies();
  }
  void addMovies(Movie m){
    currentMovies.add(m);
  }
  String deleteMovies(String id){

    int index=currentMovies.indexWhere((element) => element.id.toString()==id);
    if(index!=-1){
      currentMovies.removeAt(index);
      return"Movie deleted";
    }
    else {
      return"Movie not found";
    }
  }
  int updateMovie(String  oldName ,String newName,time,date,[double price=0]){
   // currentMovies.contains(Movie(n:oldName));
    int index = currentMovies.indexWhere((element) {
      element.name == newName;
    });
    if(index==-1){
      int e = currentMovies.indexWhere((element) {
        element.name == oldName;
      });
    currentMovies.elementAt(e).name=newName;
    if(price==0){
      price = currentMovies.elementAt(e).price;
    }
    currentMovies.elementAt(e).price=price;
    currentMovies.elementAt(e).time=time;
    currentMovies.elementAt(e).date=date;
    }
    }
  }











