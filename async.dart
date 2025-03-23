import 'dart:convert';
import 'package:http/http.dart' as http;

void main() async {
  print('Fetching user data...');
  String user = await fetchUser();
  print('User: $user');
}

Future<String> fetchUser() async {
  var url = Uri.parse('https://jsonplaceholder.typicode.com/users/1');
  var response = await http.get(url); // Waits for response
   print('RESPONSE DONE');

  if (response.statusCode == 200) {
    var data = jsonDecode(response.body);
    return data['name']; // Returns the user's name
  } else {
    throw Exception('Failed to load user');
  }
}