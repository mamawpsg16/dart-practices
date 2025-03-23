String greetPositional([String name = "Guest"]) { // [] makes the parameter positional & optional
  return "Hello, $name!";
}

String greetNamed({String name = "Guest"}) { // {} makes the parameter named & optional
  return "Hello, $name!";
}
