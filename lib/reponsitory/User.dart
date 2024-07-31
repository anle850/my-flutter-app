
import 'Person.dart';

class User extends Person{
  int height;
  int weight;

  User(this.height, this.weight) : super(19);



  void logUser(){
    print('$height - $weight - $age');
  }

}