class Person {
String name;
int age;
int size;
String hairColor;

Person (String n,String h,int a,int s){
  name=n;
  hairColor=h;
  age=a;
  size=s;

}
void walk(){
  print("function walk");
  void eat(){
    print("function eat");
    void speak(){
      print("function speak");
    }
  }
}

}class Student extends Person{
  int average;

  Student(int average,String n,String h,int a,int s ) :super(n,h,a,s){
    print("Information about student");

  }

}
class Teacher extends Person{
  String specialization ;
  Teacher(String specialization,String n,String h,int a,int s) : super(n,h,a,s){
    print("Information about teacher");
  }
}
void main() {
  var student = Student(98,"Leen","black",38, 30);
  var teacher = Teacher("English","Sara","black", 30, 40);
}
