// 📌 Understanding Soundness in Dart 🚀  
// Dart is a soundly typed language, meaning it enforces type safety at both compile-time and runtime. 

// 🔹 What is Soundness?
// Soundness ensures that a variable cannot hold a value of a different type than its declared type.
void main() {
  String message = "Hello";  // ✅ Correct: String assigned to a String variable
  // message = 10; // ❌ Error: Cannot assign an int to a String variable

  Dog dog = Dog();  // ✅ Correct: Dog object assigned to a Dog variable
  print(dog.makeSound());

  Car car = Car()..drive(100); // ✅ Correct: Car object assigned to a Car variable

  inferenceUsingBounds();

    var (myList, myInt) = f1([1]);
    // myInt.whatever; // Compile-time error, `myInt` has type `int`.
    print(myInt.isEven);  // ✅ Works because `int` has `.isEven`
    print(myInt);
    print(myList);


    var (mySet, myString) = f1({'Hello!'});
    mySet.union({}); // Works, `mySet` has type `Set<String>`.
    print(mySet);
    print(myString);
}

// 🔹 Benefits of Soundness
// ✅ Faster Execution (better compiler optimizations)
// ✅ Fewer Bugs (type mismatches caught early)
// ✅ Better Developer Experience (improved IDE suggestions)

// 🔹 Tips for Passing Static Analysis
// Ensure your code follows type safety to avoid runtime crashes.

// 1️⃣ Use Sound Return Types When Overriding Methods
class Animal {
  String makeSound() => "Roar";  // ✅ Ensures all subclasses return a String
}

class Dog extends Animal {
  @override
  String makeSound() => "Bark";  // ✅ Correct return type
}

// 🔹 Bad Example: Incorrect Return Type
/*
class Cat extends Animal {
  @override
  int makeSound() => 10; // ❌ Error: Return type must match parent class
}
*/

// 2️⃣ Use Sound Parameter Types When Overriding Methods
class Vehicle {
  void drive(int speed) {
    print("Driving at $speed km/h");
  }
}

class Car extends Vehicle {
  @override
  void drive(int speed) {  // ✅ Correct parameter type
    print("Car driving at $speed km/h");
  }
}

// 🔹 Bad Example: Incorrect Parameter Type
/*
class Bike extends Vehicle {
  @override
  void drive(String speed) { // ❌ Error: Parameter type must match
    print("Bike speed: $speed");
  }
}
*/

// 3️⃣ Don't Use a Dynamic List as a Typed List
void listExample() {
  List<int> numbers = [1, 2, 3];  // ✅ Correct: Explicitly typed list
  // List<int> numbers = [1, "two", 3]; // ❌ Error: Mixing types in a typed list
}

// 🔹 Runtime Checks: Dart prevents type mismatches at runtime
void runtimeCheck() {
  dynamic value = "Hello";
  // int number = value; // ❌ Error: Cannot assign dynamic String to int
  int number = value as int; // ❌ Error at runtime
}

// 🔹 Implicit Downcasts from Dynamic
void downcastExample() {
  dynamic data = "Dart";
  // int number = data; // ❌ Error: Can't assign dynamic String to int
  String text = data;  // ✅ Correct: Assigning dynamic to correct type
}

// 🔹 Type Inference in Dart
void typeInference() {
  var name = "John";  // ✅ Dart infers 'String'
  var age = 30;        // ✅ Dart infers 'int'
  var isFlutter = true; // ✅ Dart infers 'bool'
  // name = 42; // ❌ Error: Can't change type from String to int
}

// 🔹 Static Field and Method Inference
class Person {
  static var count = 0; // ✅ Dart infers 'int'
  static void sayHello() => print("Hello");
}

// 🔹 Local Variable Inference
void localInference() {
  var num = 100; // ✅ Dart infers 'int'
  num += 50;     // ✅ Works fine
  // num = "hello"; // ❌ Error: Can't assign String to int
}

// 🔹 Type Argument Inference
List<T> createList<T>(T element) {
  return [element];
}

void mainGeneric() {
  var stringList = createList("Dart");  // ✅ Dart infers List<String>
  var intList = createList(10);         // ✅ Dart infers List<int>
}

// 🔹 Substituting Types
void substitutingTypes() {
  List<Object> objects = ["text", 42, true]; // ✅ Works because Object can hold any type
  // List<int> numbers = objects; // ❌ Error: Can't assign List<Object> to List<int>
}

// 🔹 Generic Type Assignment
class Box<T> {
  T value;
  Box(this.value);
}

void genericAssignment() {
  var intBox = Box<int>(42);  // ✅ Correct: T = int
  var stringBox = Box("Dart"); // ✅ Correct: T = String
  // intBox.value = "text"; // ❌ Error: Can't assign String to int
}

// 🔹 Methods with Generics
T getFirst<T>(List<T> list) {
  return list[0];
}

void genericMethods() {
  var numbers = [1, 2, 3];
  var firstNumber = getFirst(numbers); // ✅ Type inferred as int
}


// 🔹 Inference Using Bounds
// If a generic type has an upper bound, Dart will infer the most specific type within that bound.
T minValue<T extends num>(T a, T b) {
  return (a < b) ? a : b;
}

void inferenceUsingBounds() {
  var minInt = minValue(10, 20);    // ✅ T inferred as int
  var minDouble = minValue(5.5, 2.3); // ✅ T inferred as double
  // var minString = minValue("a", "b"); // ❌ Error: String does not extend num
  print(minInt);
  print(minDouble);
}


class A<X extends A<X>> {}

class B extends A<B> {}

class C extends A<C> {}  // ✅ Fix: C directly extends A<C>

void f<X extends A<X>>(X x) {}

void classInferenceBounds() {
  f(B()); // ✅ OK: B satisfies A<B>.
  f(C()); // ✅ OK: C satisfies A<C>.
}

X max<X extends Comparable<num>>(X x1, X x2) => x1.compareTo(x2 as num) > 0 ? x1 : x2;


void comparableInference() {
  var maxInt = max(3, 7);       
  var maxDouble = max(5.5, 2.3);
  print(maxInt);
  print(maxDouble);
}

(X, Y) f1<X extends Iterable<Y>, Y>(X x) => (x, x.first);

