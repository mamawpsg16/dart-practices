// Using null safety, incorrectly:
// The late modifier means "enforce this variable's constraints at runtime instead of at compile time
class Coffee {
  late String _temperature;

  void heat() { _temperature = 'hot'; }
  void chill() { _temperature = 'iced'; }

  String serve() => _temperature + ' coffee';
}

void main() {
  var coffee = Coffee();
  coffee.heat();
  print(coffee.serve());
}