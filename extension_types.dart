extension type MyWrapper(int value) {
  static void myStaticMethod() {
    print("Static method in extension type.");
  }

  void instanceMethod() {
    print("Instance method called on $value");
  }
}

extension type Currency(double value) {
  // Prevent unsafe operations like adding a percentage directly
  Currency operator +(Currency other) => Currency(value + other.value);
  Currency operator -(Currency other) => Currency(value - other.value);
  
  // Allow multiplication with scalars (e.g., tax multipliers)
  Currency operator *(double multiplier) => Currency(value * multiplier);

  // Formatting function
  String formatted() => "\$${value.toStringAsFixed(2)}";

  // Convert from cents (useful when dealing with APIs)
  static Currency fromCents(int cents) => Currency(cents / 100);
}

void main() {
  MyWrapper.myStaticMethod(); // Correct
  MyWrapper(10)..instanceMethod(); // Correct

  Currency price = Currency(19.99);
  Currency tax = Currency(1.50);
  
  // Safe operations
  Currency total = price + tax; // OK
  Currency discounted = price * 0.9; // OK

  print("Total: ${total.formatted()}"); // Output: Total: $21.49

}
