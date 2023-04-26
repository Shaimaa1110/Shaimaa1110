
import 'Movie.dart';

List<Movie> currentMovies=[
  Movie(n:'Divergent    ',          d:'23.4.2023', t:'06:00 pm',    v:'Irbid City Centre',   p:6),
  Movie(n:'Insurgent    ',          d:'24.4.2023', t:'04:00 pm',    v:'Irbid City Centre',   p:6),
  Movie(n:'Allegiant    ',          d:'26.4.2023', t:'07:00 pm',    v:'Irbid City Centre',   p:6),
  Movie(n:'Bergen       ',          d:'1.5.2023',  t:' 06:30 pm',   v:' Irbid City Centre',   p:5),
  Movie(n:'Me Before You',          d:'3.5.2023',  t:' 08:00 pm',   v:' Irbid City Centre',   p:10),
];

viewMovies(){
  print("Movie name :        Date:         Time:          Venue:                Price:      ");
  for(int i=0;i<currentMovies.length;i++)
    {
      print("${currentMovies.elementAt(i).id} ${currentMovies.elementAt(i).name}     ${currentMovies.elementAt(i).date}     ${currentMovies.elementAt(i).time}     ${currentMovies.elementAt(i).venue}      ${currentMovies.elementAt(i).price}");
    }
}
