import 'dart:math';
import 'package:http/http.dart' as http;
import 'libs/utils.dart';

void example() async {
  print(sqrt(25)); // Output: 5.0
  var response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts/1'));
  print(response.body);
  print(greet("Maricar")); // Output: Hello, Maricar!

}

class PersonV1 {
  String name;
  int _age; // Private variable

  PersonV1(this.name, this._age);

  void _showAge() { // Private method
    print("Age: $_age");
  }
}