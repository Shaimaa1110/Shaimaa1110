
var currentId=1;
class Movie{
  int _id;
  String _name,_date,_time,_venue;
  double _price;
Movie({String n, String d, String t, String v,double p}){
_name = n;
_date = d;
_time = t;
_venue = v;
_price = p;
_id=currentId++;
}

  double get price => _price;

  get venue => _venue;

  get time => _time;

  get date => _date;

  String get name => _name;

  int get id => _id;
}