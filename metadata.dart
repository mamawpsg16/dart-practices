
class Example {
  @deprecated // Legacy way (Use @Deprecated instead)
  void oldMethod() {
    print("This method is deprecated.");
  }
  /// Use [newMethod] to turn the power on instead.
  @Deprecated("Use newMethod() instead.") // Recommended way
  void anotherOldMethod() {
    print("Deprecated method.");
  }

  void newMethod() {
    print("Use this method instead.");
  }
}

class Animal {
  void makeSound() => print("Animal sound");
}

class Dog extends Animal {
  @override
  void makeSound() => print("Woof!");
}

@pragma('vm:never-inline')
//Useful when debugging performance issues (stopping the compiler from optimizing away function calls).

// Ensures the function has its own stack trace when debugging.
void myFunction() {
  print("This function won't be inlined.");
}

@pragma('vm:prefer-inline')
//If a function is small and frequently called, you might want to force inlining for better performance.
int add(int a, int b) {
  return a + b;
}


class MyAnnotation {
  final String message;
  const MyAnnotation(this.message);
}

@MyAnnotation("This class is special!")
class SpecialClass {
  void showMessage() {
    print("This class has custom metadata.");
  }
}


void example(){
  var example = Example();
  example.oldMethod(); // Shows a warning
  example.anotherOldMethod(); // Shows a warning with message
  example.newMethod(); // No warning
  
  var pet = Dog();
  pet.makeSound(); // Output: Woof!

  myFunction();

  var obj = SpecialClass();
  obj.showMessage();
}