// Dart Operators - Real-World Use Cases with Comments

void example() {
  // 1. Arithmetic Operators
  int a = 10, b = 3;
  print(a + b); // Addition (13)
  print(a - b); // Subtraction (7)
  print(a * b); // Multiplication (30)
  print(a / b); // Division (3.3333)
  print(a ~/ b); // Integer Division (3)
  print(a % b); // Modulus (1 - remainder)

  // 2. Unary Operators
  int x = 5;
  print(-x); // Unary minus (-5)
  print(++x); // Pre-increment (6)
  print(x--); // Post-decrement (6, then x becomes 5)
  print("After post decrement $x"); // becomes 5

  // 3. Relational and Type Test Operators
  print(a > b); // Greater than (true)
  print(a <= b); // Less than or equal (false)
  print(a is int); // Type check (true)
  print(a is! double); // Type negation (true)

  // 4. Logical Operators
  bool isLoggedIn = true;
  bool hasPermission = false;
  print(isLoggedIn && hasPermission); // Logical AND (false)
  print(isLoggedIn || hasPermission); // Logical OR (true)
  print(!isLoggedIn); // Logical NOT (false)

  // 5. Bitwise Operators (Used in low-level operations)
  int p = 5; // 0101 in binary
  int q = 3; // 0011 in binary
  print(p & q); // Bitwise AND (1 - 0001)
  print(p | q); // Bitwise OR (7 - 0111)
  print(p ^ q); // Bitwise XOR (6 - 0110)
  print(p << 1); // Left shift (10 - 1010)
  print(p >> 1); // Right shift (2 - 0010)

  // 6. Assignment Operators
  int num = 10;
  num += 5; // num = num + 5 (15)
  num -= 2; // num = num - 2 (13)
  num *= 2; // num = num * 2 (26)
  print(num);

  // 7. Conditional Operator (Ternary Operator)
  int age = 20;
  String canVote = (age >= 18) ? "Yes" : "No";
  print("Can vote: $canVote");

  // 8. Null-aware Operators (Handling null values safely)
  String? name;
  print(name ?? "Guest"); // If name is null, print "Guest"

  // 9. Cascade Operator (Used to perform multiple operations on the same object)
  Person()..setName("Alice")..setAge(25)..display();

  Object  value = "Hello, Dart!";
  
  // Without 'as', accessing string properties would cause an error:
  // print(value.length); // ❌ Error: The compiler doesn't know it's a String

  // Correct way: Use 'as' to cast it explicitly
  print((value as String).length); // ✅ Output: 13

  assert(2 + 3 == 5);
  assert(2 - 3 == -1);
  assert(2 * 3 == 6);
  assert(5 / 2 == 2.5); // Result is a double
  assert(5 ~/ 2 == 2); // Result is an int
  assert(5 % 2 == 1); // Remainder

  assert('5/2 = ${5 ~/ 2} r ${5 % 2}' == '5/2 = 2 r 1');

  demonstrateOperators();

  Dog pet = Dog(); // Upcasting: Dog is assigned to an Animal type

  pet.makeSound(); // ✅ Works, because makeSound() is in Animal

  pet.bark(); // ✅ Casting to Dog allows us to call bark()

  Animal pet1 = Dog(); // Upcasting: Dog is assigned to an Animal type

  pet1.makeSound(); // ✅ Works, because makeSound() is in Animal

  (pet1 as Dog).bark(); // ✅ Casting to Dog allows us to call bark()
}

class Person {
  String? name;
  int? age;
  void setName(String name) => this.name = name;
  void setAge(int age) => this.age = age;
  void display() => print("Name: $name, Age: $age");
}


class User {
  String? name;
  void greet() => print("Hello, $name");
}


void demonstrateOperators() {
  User? user;
  user?..name = "Alice"; // If user is null, nothing happens
  user?.greet(); // Won't execute because user is null

  user = User();
  user?..name = "Bob"..greet(); // Chained cascade

  // 7. Nested cascades
  var person = (User()
    ..name = "Charlie"
    ..greet());

  // 8. Spread operator
  var list1 = [1, 2, 3];
  var list2 = [0, ...list1, 4]; // Spreading list1 into list2
  print(list2);

  var nullableList = null;
  var combinedList = [...?nullableList, 5, 6]; // Safe null spread
  print(combinedList);

  // 9. Other operators
  var numbers = [10, 20, 30];
  print(numbers[1]); // [] operator
  print(numbers?[2]); // Correct way to safely access index 2

  User? obj = User();

  obj = null;
  print(obj?.name); // Won't throw an error, just prints null

  obj = User();
  print(obj!.name); // ! operator (forces non-null, can throw runtime error if null)
}


class Animal {
  void makeSound() => print("Animal sound");
}

class Dog extends Animal {
  void bark() => print("Woof!");
}