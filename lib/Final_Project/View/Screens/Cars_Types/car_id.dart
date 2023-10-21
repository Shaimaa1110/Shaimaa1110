import 'dart:developer';

import 'items.dart';


List<Item> itemslist(String id){
  List<Item> temp=[];
  for(Item i in  items){
    if(i.Car_Type_id==id)
      temp.add(i);
  }
  log("function ${temp[0].Car_Type_id}");
  return temp;
}
String getPageName(String id) {
  for (Item i in items) {
    if (i.Car_Type_id == id) {
      return i.pageName;
    }
  }
  return '';
}