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

  /** VARIABLE */
  switch ((1, "2")) {
    case (int a, String b):
      print('named $a $b ');
    case (var a, var b): 
      print('$a $b');
    default:
      print('No match');
  }

  /** Identifier */
  const c = 1;
  switch (2) {
    case c:
      print('match $c');
    default:
      print('no match'); // Prints "no match".
  }

  /** PARENTHERISIZED */
  String checkAccess((String role, bool isSubscribed) user) {
    return switch (user) {
      ('admin', _) => 'Full access',
      ('moderator', true) || ('user', true) => 'Limited access',
      ('moderator', false) || ('user', false) => 'No access',
      _ => 'Unknown'
    };
  }

  print(checkAccess(('admin', true)));     // Full access
  print(checkAccess(('moderator', true))); // Limited access
  print(checkAccess(('user', true)));      // Limited access
  print(checkAccess(('moderator', false)));// No access
  print(checkAccess(('user', false)));     // No access

  /** Rest element */

  var [a, b, ..., d, e] = [1, 2, 3, 4, 5, 6, 7];
    // Prints "1 2 6 7".
  print('$a $b $d $e');
  var [f, g, ...rest, h] = [1, 2, 3, 4, 5, 6, 7];
  print('$f $g $rest $h');


  /** MAP */
  final {'foo': int? foo} = {'foo': 42};  //ENSURE A FOO EXISTS IN THE MAP WITH NULLABLE INT AND ASSIGN TO foo VARIABLE
  print(foo); // ✅ Output: 42
  Map<String, dynamic> data = {};

  switch (data) {
    case {'foo': int? foo}:
      print('Foo is $foo');
    default:
      print('Key "foo" not found.');
  } 

  if (data case {'foo': int? foo}) {
    print('Foo is $foo');
  } else {
    print('Key "foo" not found.');
  }

  /** RECORD */
  var (myString: foo1, myNumber: bar1) = (myString: 'string', myNumber: 1);

  print(foo1); // ✅ Output: string
  print(bar1); // ✅ Output: 1

  var myRecord = (myString: 'stringv1', myNumber: 2);
  
  final (:myString, :int myNumber) = myRecord;  
  
  print(myString); // Output: string
  print(myNumber); // Output: 1

  var record1 = (name: "Alice", age: 25);

  switch (record1) {
    case (name: var n, age: var a):
      print('Name: $n, Age: $a'); // ✅ Output: Name: Alice, Age: 25
  }

  var record2 = (name: "Bob", age: 30);

  switch (record2) {
    case (name: String n, age: int a):
      print('Name: $n, Age: $a'); // ✅ Output: Name: Bob, Age: 30
    default:
      print('No match');
  }

  var record3 = (checked: "Valid", asserted: null);

  switch (record3) {
    case (checked: var c?, asserted: var a?): // `a!` ensures a non-null value
    // case (checked: var c?, asserted: var a!): // `a!` ensures a non-null value
      print('Checked: $c, Asserted: $a');
    case (checked: var c?, asserted: null):
      print('Checked: $c, but asserted is null'); // ✅ Output
    default:
      print('No match');
  }

  var record4 = ('Alice', 30);

  switch (record4) {
    case (String name, int age):
      print('Name: $name, Age: $age'); // ✅ Output: Name: Alice, Age: 30
  }

  var record5 = (untyped: 42, typed: "Hello");

  switch (record5) {
    case (untyped: var u as int, typed: var t as String):
      print('Integer: $u, String: $t'); // ✅ Output: Integer: 42, String: Hello
    default:
      print('No match');
  }

  /** OBJECT */
  var shape = Rectangle(10, 20);

  switch (shape) {
    case Rectangle(width: var w, height: var h):
      print('Width: $w, Height: $h'); // ✅ Output: Width: 10, Height: 20
  }

  //Using Object Patterns in var Destructuring
  var rect = Rectangle(5, 15);

  var Rectangle(:width, :height) = rect; // Destructuring with shorthand syntax

  print('Width: $width, Height: $height'); // ✅ Output: Width: 5, Height: 15

  Shape shape1 = Circle(7);
  //Matching Subclasses
  switch (shape1) {
    case Circle(radius: var r):
      print('Circle with radius: $r'); // ✅ Output: Circle with radius: 7
    default:
      print('Unknown shape');
  }

  /** WILDCARD */
  var list = [1, 2, 3];
  var [_, two, _] = list;
  print(two); // ✅ Output: 2

  var newRecord = ("Kevin", 30);
  switch (newRecord) {
    case (String _, int _):
      print("First value is a string, second is an integer");
      break;
    default:
      print("No match");
  }

}

class Rectangle {
  final double width;
  final double height;

  Rectangle(this.width, this.height);
}

class Shape {}

class Circle extends Shape {
  final double radius;
  Circle(this.radius);
}

