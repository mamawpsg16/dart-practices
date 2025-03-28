// ✔ covariant allows overriding a method with a more specific parameter type.
// ✔ Useful when a parent class handles generic data but a subclass requires a strict type.
// ✔ Should be used carefully to avoid type errors at runtime.

class Shape {
  void draw(covariant num size) { // ✅ Allows subclasses to be more specific
    print('Drawing a shape with size $size');
  }
}

class Circle extends Shape {
  @override
  void draw(double radius) { // ✅ Now radius must be a double
    print('Drawing a circle with radius $radius');
  }
}

void main(){
  Circle().draw(5.0);
}