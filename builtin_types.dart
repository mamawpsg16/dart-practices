void example() {
  // ✅ Numbers: int, double
  int age = 25; 
  double price = 19.99;
  num anyNumber = 42; // Can be int or double

  print("Age: $age, Price: $price, AnyNumber: $anyNumber");

  // ✅ Strings: String
  String name = "Alice";
  String greeting = "Hello, $name!";
  print(greeting);

  // ✅ Booleans: bool
  bool isDartFun = true;
  bool isValid = age > 18;
  print("Is Dart fun? $isDartFun, Is valid? $isValid");

  // ✅ Records: (value1, value2)
  var person = ("Alice", 25, true);
  print("Person: Name: ${person.$1}, Age: ${person.$2}, Active: ${person.$3}");

  // ✅ Functions: Function
  Function add = (int a, int b) => a + b;
  print("Addition: ${add(3, 4)}");

  // ✅ Lists (Arrays): List
  List<int> numbers = [1, 2, 3, 4, 5];
  print("Numbers List: $numbers, First: ${numbers.first}, Last: ${numbers.last}");

  // ✅ Sets: Set (Unique values)
  Set<String> uniqueNames = {"Alice", "Bob", "Alice"};
  print("Unique Names: $uniqueNames");

  // ✅ Maps: Map (Key-Value pairs)
  Map<String, int> ages = {"Alice": 25, "Bob": 30};
  print("Alice's age: ${ages['Alice']}");

  // ✅ Runes (Unicode Characters)
  Runes heart = Runes('\u2764');
  print("Heart Symbol: ${String.fromCharCodes(heart)}");

  // ✅ Symbols
  Symbol mySymbol = #myVar;
  print("Symbol: $mySymbol");

  // ✅ Null type
  String? nullableString;
  print("Nullable String: $nullableString"); // null

  // ✅ DateTime (Not listed above but built-in)
  DateTime now = DateTime.now();
  print("Current Date & Time: $now");

  // ✅ Duration (Used with DateTime)
  Duration oneDay = Duration(days: 1);
  DateTime tomorrow = now.add(oneDay);
  print("Tomorrow's Date: $tomorrow");
}
