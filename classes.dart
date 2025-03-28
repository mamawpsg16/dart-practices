class Spacecraft {
  String name;
  DateTime? launchDate;

  // Read-only non-final property
  int? get launchYear => launchDate?.year;

  // Constructor where parameter names are different
  // Spacecraft(String spacecraftName, DateTime? launch) {
  //   name = spacecraftName;
  //   launchDate = launch;
  // }
  // Constructor, with syntactic sugar for assignment to members.
  Spacecraft(this.name, this.launchDate) {
    print("-------------- CLASSES --------------");
    // Initialization code goes here.
  }

  // Named constructor that forwards to the default one.
  Spacecraft.unlaunched(String name) : this(name, null);

  // Method.
  void describe() {
    print('Spacecraft: $name');
    // Type promotion doesn't work on getters.
    var launchDate = this.launchDate;
    if (launchDate != null) {
      int years = DateTime.now().difference(launchDate).inDays ~/ 365;
      print('Launched: $launchYear ($years years ago)');
    } else {
      print('Unlaunched');
    }
  }
}

class Car {
  String? brand; // Default value is null
  int? year;     // Default value is null
}

class Point {
  double x, y;

  // Default constructor
  Point(this.x, this.y);

  // Named constructor using an initializer list
  Point.origin() : x = 0, y = 0;
}

class Rectangle {
  final double width;
  final double height;
  final double area;

  // Using initializer list to calculate area
  Rectangle(this.width, this.height) : area = width * height;
}

class ImmutablePoint {
  final double x, y;
  const ImmutablePoint(this.x, this.y);
}

class Circle {
  double _radius;

  Circle(this._radius);

  // Getter
  double get radius => _radius;

  // Setter
  set radius(double value) {
    if (value > 0) {
      _radius = value;
    }
  }
}

class MathUtils {
  static const double pi = 3.14;
  int instanceVariable = 10;
  
  static double square(double num) => num * num;
}

abstract class Animal {
  void makeSound();
}

class Dog implements Animal {
  @override
  void makeSound() => print('Woof!');
}


class AnimalV2 {
  void breathe() => print('Breathing...');
}

class Cat extends AnimalV2 {
  void meow() => print('Meow!');
}

class Singleton {
  static final Singleton _instance = Singleton._internal();

  factory Singleton() {
    return _instance;
  }

  Singleton._internal(); // Private constructor
}


void main(){
  var voyager = Spacecraft('Voyager I', DateTime(1977, 9, 5));
  voyager.describe();
  print("SPACE CRAFT NAME = ${voyager?.name}");

  var voyager3 = Spacecraft.unlaunched('Voyager III');
  voyager3.describe();

  
  /** Default Constructor (Implicit) */
  var car = Car();
  print("\n ${car.brand}"); // null

  /** Named Constructor */
  var p1 = Point(3, 4);
  var p2 = Point.origin();

  print('p1: (${p1.x}, ${p1.y})'); // p1: (3.0, 4.0)
  print('p2: (${p2.x}, ${p2.y})'); // p2: (0.0, 0.0)

  /** CONSTRUCTOR WITH INITIALIZER LIST */
  var rect = Rectangle(4, 5);
  print(rect.area); // 20

  /**  Constant Constructor (const) */
  //If your class has only final fields, you can use const to create compile-time constants.

  var p3 = const ImmutablePoint(1, 1);
  var p4 = const ImmutablePoint(1, 1);

  print(identical(p3, p4)); // true (same instance)

  /** SETTERS AND GETTERS */
  var c = Circle(5);
  print(c.radius); // 5
  c.radius = 10;  // Using setter
  print(c.radius); // 10

  /** Static Variables and Methods 
   * Static variables belong to the class rather than an instance.
   * Static methods don’t have access to this.
  */

  print(MathUtils.pi);         // 3.14
  print(MathUtils.square(4));  // 16.0

  /**  Implementing Interfaces */
  var dog = Dog();
  dog.makeSound(); // Woof!

  /** Extending a Class (extends) */
  var cat = Cat();
  cat.breathe(); // Inherited method
  cat.meow();    // Child method

  /** FACTORY CONSTRUCTORS
   * A singleton ensures only one instance exists.
   */
  var s1 = Singleton();
  var s2 = Singleton();

  print(identical(s1, s2)); // true (same instance)

  /** GETTING AN OBJECT TYPE */
  int a = 25;
  print('The type of a is ${a.runtimeType}');
}