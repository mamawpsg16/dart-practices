enum Color { red, yellow, blue, green }

void main() {
  
  /** Logical-or */
  Color color = Color.green;

  var isPrimary = switch (color) {
    Color.red || Color.yellow || Color.blue => true, // Matches any primary color
    Color.green => "Hello its Green", // Matches green color
    _ => false, // Default case for other colors
  };

  print(isPrimary); // Output: true

  /** Logical-and */
  switch ((1, 2)) { //TO TRIGGER DEFAULT
  // switch ((1, 2, 3)) {
    case (var a, var b, var c) && (var x, var y, var z): 
      print('$a $b $c');
    default: // ✅ Correct syntax
      print('No match');
  }

  /** Cast */
  (num, Object) record = (1, 's');
  var (i as int, s as String) = record;
  print("i: $i, s: $s"); // Output: i: 1, s: s
  
  /**NULL CHECK */
  String? maybeString = null; // 🔴 `null` case

  switch (maybeString) {
    case var s?:
      print('Non-null String: $s');
    default:
      print('Value is null'); // ✅ This will execute
  }

  /** NULL Combining with Type Checking (is) */
  num? maybeNumber = 3; // Nullable num type
  String string = "Hello bro";

  // switch (maybeNumber) {
  switch (string) {
    case int n?: 
      print('It is an integer: $n');
    case double d?:
      print('It is a double: $d'); 
    case String s?:
      print('It is a string: $s'); // ✅ Matches here
    default:
      print('Value is null');
  }

  /** NULL ASSERT */
   List<String?> userData = ['JohnDoe', null];

  try {
    switch (userData) {
      case [var username, var email!]: // `email!` ensures it's not null
        print('User: $username, Email: $email');
    }
  } catch (e) {
    print('Error: Email cannot be null!'); // 🔴 Triggers if email is null
  }

  (String?, String?) userPreferences = ('dark', "Dart"); // theme, language

  try {
    var (theme!, language!) = userPreferences; // Ensures language is not null
    print('Theme: $theme, Language: $language');
  } catch (e) {
    print('Error: Language preference cannot be null!');
  }

  /** CONSTANT */
  // 1️⃣ Basic Example: Matching a Constant Number
  int number = 1;

  switch (number) {
    case 1:
      print('Number is one!');
    case 2:
      print('Number is two!');
    default:
      print('Number is something else.');
  }

  //2️⃣ Using Named Constants in Pattern Matching
  const int maxRetries = 3;
  int retries = 3;

  switch (retries) {
    case maxRetries: // ✅ Matches if `retries == maxRetries`
      print('Reached max retries!');
    default:
      print('Retries left: ${maxRetries - retries}');
  }

  //  3️⃣ Matching Strings with Constant Patterns
   String status = 'success';

  switch (status) {
    case 'success':
      print('Operation succeeded!');
    case 'error':
      print('Operation failed!');
    default:
      print('Unknown status');
  }

  //  4️⃣ Matching null with Constant Pattern
   String? value = null;
  switch (value) {
    case null:
      print('Value is null.');
    default:
      print('Value is $value');
  }

  //  7️⃣ Matching Constant Lists and Maps
  List<int> numbers = [1, 2];

  switch (numbers) {
    case const [1, 2]: // ✅ Matches a constant list
    //  case [1, 2]: // ✅ Match dynamically
      print('Matched [1, 2]');
    default:
      print('No match');
  }

  Map<String, int> user = {'id': 1, 'age': 25};

  switch (user) {
    case const {'id': 1, 'age': 25}: // ✅ Matches a constant map
    //case {'id': 1, 'age': 25}: // ✅ Match dynamically
      print('User found!');
    default:
      print('User not found.');
  }
}
