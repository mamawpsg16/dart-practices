/** Generative constructors 
 * If you don't declare a constructor, Dart uses the default constructor.
 *  The default constructor is a generative constructor without arguments or name.
*/
class Point {
  // Instance variables to hold the coordinates of the point.
  double x;
  double y;

  // Generative constructor with initializing formal parameters:
  // Main constructor
  Point(this.x, this.y);

  // Redirecting constructor
  Point.origin() : this(0, 0);
}

/** Named constructors */
const double xOrigin = 0;
const double yOrigin = 0;

class PointV1 {
  final double x;
  final double y;

  // Sets the x and y instance variables
  // before the constructor body runs.
  PointV1(this.x, this.y);

  // Named constructor
  PointV1.origin() : x = xOrigin, y = yOrigin;
}

/** Constant constructors
 * if your class produces unchanging objects, make these objects compile-time constants. 
 * To make objects compile-time constants, define a const constructor with all instance variables set as final.
 */
class ImmutablePoint {
  static const ImmutablePoint origin = ImmutablePoint(0, 0); // Compile-time constant instance

  final double x, y; // Immutable (final) instance variables

  const ImmutablePoint(this.x, this.y); // Constant constructor
}

class Person {
  String name;
  int age;

  // Main constructor
  Person(this.name, this.age);

  // Redirecting constructor
  Person.withDefaultName() : this('Unknown', 18);
}

class User {
  final String name;
  final int age;

  User(this.name, this.age);

  factory User.fromJson(Map<String, dynamic> json) {
    return User(json['name'], json['age']);
  }
}


/** Instance Variable Initialization 
 * Direct Initialization
*/
class PersonV2 {
  String name = "Default Name"; // Direct initialization
  int age = 18;
}

class PersonV3 {
  String name;
  int age;

  // Constructor
  PersonV3(this.name, this.age);
}

class PersonV4 {
  String name;
  int age;

  // Initializer list
  PersonV4(String name, int age) : name = name, age = age {
    print("Constructor executed");
  }
}

class PersonV5 {
  late String name; // Late initialization

  void setName(String newName) {
    name = newName; // Assigning later
  }
}

class PointB {
  final double x;
  final double y;

  // Standard constructor using initializing formal parameters
  PointB(this.x, this.y);

  // Optional parameters with default values
  PointB.optional([this.x = 0.0, this.y = 0.0]);
}

class PointC {
  final double _x;
  final double _y;

  // Named constructor with initializer list
  PointC.namedPrivate({required double x, required double y})
      : _x = x,
        _y = y;

  void printPoint() {
    print("PointB.namedPrivate: ($_x, $_y)");
  }
}

class PointD {
  double x;
  double y;

  // Named constructor with default values
  PointD.named({this.x = 1.0, this.y = 1.0});

  @override
  String toString() {
    return 'PointC.named($x, $y)';
  }
}

class PointE {
  double? x; // Nullable
  double? y;

  PointE(this.x, this.y);

  @override
  String toString() {
    return 'PointD($x, $y)';
  }
}

class PointF {
  final double x;
  final double y;

  // Initializer list assigns values before constructor runs
  PointF.fromJson(Map<String, double> json)
      : x = json['x']!,
        y = json['y']! {
    print('In Point.fromJson(): ($x, $y)');
  }
}

class PointG{
  final double x;
  final double y;

  // Validate inputs before constructor runs
  PointG.withAssert(this.x, this.y) : assert(x >= 0) {
    print('In Point.withAssert(): ($x, $y)');
  }
}

class Employee {
  final String name;
  final double salary;

  // Base class constructor
  Employee(this.name, this.salary);

  void showDetails() {
    print('Employee: $name, Salary: \$$salary');
  }
}

// Child class extending Employee
class Manager extends Employee {
  final int teamSize;

  // Using super parameters to forward arguments
  Manager(super.name, super.salary, this.teamSize);

  @override
  void showDetails() {
    print('Manager: $name, Salary: \$$salary, Team Size: $teamSize');
  }
}

void main(){

  // 
  // Create a new Point
  var p = Point(2, 3);
  print('Point: (${p.x}, ${p.y})');

  /** Constant constructors */
  var p3 = const ImmutablePoint(1, 1);
  var p4 = const ImmutablePoint(1, 1);

  /** Redirecting constructors */
  var p1 = Point(3, 4);
  var p2 = Point.origin();

  print('p1: (${p1.x}, ${p1.y})'); // p1: (3, 4)
  print('p2: (${p2.x}, ${p2.y})'); // p2: (0, 0)

  var p5 = Person('Alice', 25);
  var p6 = Person.withDefaultName();

  print('${p5.name}, ${p5.age}'); // Alice, 25
  print('${p6.name}, ${p6.age}'); // Unknown, 18

  /** Constructor Tear-Offs  */
   List<Map<String, dynamic>> apiResponse = [
    {'name': 'Alice', 'age': 30},
    {'name': 'Bob', 'age': 25},
  ];
  

  // Using constructor tear-off instead of lambda
  List<User> users = apiResponse.map(User.fromJson).toList();
  for (var user in users) {
    print('Name: ${user.name}, Age: ${user.age}');
  }

  /** Instance Variable Initialization */

  // Direct Initialization (Default Value)
  var person = PersonV2();
  print(person.name); // Default Name
  print(person.age);  // 18

  // Constructor Initialization (Passing Values)
  var person1 = PersonV3("Alice", 25);
  var person2 = PersonV3("Bob", 30);

  print(person1.name); // Alice
  print(person2.age);  // 30

  // Initializer List (Before Constructor Body)
  var personv4 = PersonV4("Charlie", 22);
  print(personv4.name); // Charlie

  // Using late for Delayed Initialization
  var personv5 = PersonV5();
  personv5.setName("David");
  print(personv5.name); // David

  /** Initializing Formal Parameters (Shorthand Initialization) */
  var p10 = PointB(3.0, 4.0);
  print("p10: (${p10.x}, ${p10.y})"); // p1: (3.0, 4.0)

  var p11 = PointB.optional(); // Uses default values
  var p12 = PointB.optional(10,20); 
  print("p11: (${p11.x}, ${p11.y})"); // p2: (0.0, 0.0)

  /** Named Constructor with Private Fields */
  var p13 = PointC.namedPrivate(x: 5.0, y: 6.0);
  p13.printPoint(); // PointB.namedPrivate: (5.0, 6.0)

 

  /**  Named Constructor with Default Values */
   var pointC1 = PointD.named();
  print(pointC1); // PointD.named(1.0, 1.0)

  var pointC2 = PointD.named(x: 2.0, y: 3.0);
  print(pointC2); // PointC.named(2.0, 3.0)

  /** Nullable Fields Without Initialization */
  var e = PointE(null, 5.0);
  print(e); // PointD(null, 5.0)

  /** Using an Initializer List */
  var point = PointF.fromJson({'x': 2.0, 'y': 3.5}); // In Point.fromJson(): (2.0, 3.5)


  /** Asserting Input Values */

  var point1 = PointG.withAssert(5, 3); // ✅ Valid

  var point2 = PointG.withAssert(-2, 3); // ❌ AssertionError: x >= 0

  /** CONSTRUCTOR INHERITANCE */
  var emp = Employee("Alice", 50000);
  // emp.name = 'Bob'; // Error: The setter 'name' isn't defined
  emp.showDetails();

  var manager = Manager("Bob", 80000, 10);
  manager.showDetails();
}