/** NO MODIFIER */
class RegularClass {
  void greet() {
    print("Hello from RegularClass!");
  }
}

class Child extends RegularClass {
  void sayHello() {
    print("Hello from Child!");
  }
}

class Implementer implements RegularClass {
  @override
  void greet() {
    print("Hello from Implementer!");
  }
}

/** ABSTRACT */
abstract class AbstractClass {
  void method(){
    print("Abstract method");
  }
  void greet();
}

class Concrete extends AbstractClass {
  @override
  void greet() {
    print("Implemented method");
  }
}

/** BASE */
base class BaseClass {}

base class Child1 extends BaseClass {} // Allowed
// class Implementer implements BaseClass {} // ❌ Not allowed

/** INTERFACE */
interface class InterfaceClass {
  void method(){
    print("Implemented method");
  }
}

class ImplementerV1 implements InterfaceClass {
  @override
  void method() {
    print("Implemented method");
  }
}

class Car extends InterfaceClass {
  int passengers = 4;
}

/** abstract interface */

abstract interface class AbstractInterface {
  void method();
}

class ImplementerV2 implements AbstractInterface {
  @override
  void method() {
    print("Implemented method");
  }
}

class ChildV2 extends AbstractInterface {
  @override
  void method() {
    print("Implemented method");
  }
} 

/** FINAL */
final class FinalClass {}
// class Child extends FinalClass {} // ❌ Not allowed
// class Implementer implements FinalClass {} // ❌ Not allowed

/** SEALED */
sealed class SealedClass {}

class Subclass extends SealedClass {} // ✅ Allowed in the same file
class ImplementerV4 implements SealedClass {} 

void main() {
  /** NO MODIFIER */
  RegularClass regular = RegularClass();
  regular.greet(); // Output: Hello from RegularClass!

  Child child = Child();
  child.greet(); // Output: Hello from RegularClass!
  child.sayHello(); // Output: Hello from Child!

  Implementer implementer = Implementer();
  implementer.greet(); // Output: Hello from Implementer!

  /** ABSTRACT */
  Concrete concrete = Concrete();
  concrete.method(); // Output: Implemented method

  /** INTERFACE */
  ImplementerV1 implementerV1 = ImplementerV1();
  implementerV1.method(); // Output: Implemented method
  Car car = Car();
  car.method(); // Output: Implemented method

  /** ABSTRACT INTERFACE */
  ImplementerV2 implementerV2 = ImplementerV2();  
  implementerV2.method(); // Output: Implemented method
  ChildV2 childV2 = ChildV2();
  childV2.method(); // Output: Implemented method

  /** FINAL */
  FinalClass obj = FinalClass(); // ✅ Allowed
}
