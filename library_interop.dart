import 'dart:js_interop';

@JS('greet') // Linking to the JS function
external String greet(String name);

void main() {
  print(greet("Dart")); // Output: Hello, Dart!
}
