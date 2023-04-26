
var id =0;
class Administrator{
  int _id;
  String _name, _pass;
  Administrator({String n, String p}){
    _name = n;
    _pass = p;
    _id = id++;

  }



}