/** Adding a Method to String */
extension ParseToInt on String {
  int parseInt() {
    return int.parse(this);
  }
}

/** Extension on Enum 
 * let's extend the Vehicle enum with extra functionality using an extension.
*/
enum Vehicle {
  car(tires: 4, passengers: 5, carbonPerKilometer: 400),
  bus(tires: 6, passengers: 50, carbonPerKilometer: 800),
  bicycle(tires: 2, passengers: 1, carbonPerKilometer: 0);

  const Vehicle({
    required this.tires,
    required this.passengers,
    required this.carbonPerKilometer,
  });

  final int tires;
  final int passengers;
  final int carbonPerKilometer;
}

/// ✅ Extension for additional methods
extension VehicleExtensions on Vehicle {
  /// Calculate carbon footprint per passenger
  int get carbonFootprint => (carbonPerKilometer / passengers).round();

  /// Check if a vehicle is two-wheeled
  bool get isTwoWheeled => this == Vehicle.bicycle;
}

/** Boolean-Based Comparison for Enum */
extension VehicleComparison on Vehicle {
  /// ✅ Returns true if this vehicle has a lower carbon footprint than another
  bool hasLowerCarbonFootprintThan(Vehicle other) {
    return carbonFootprint < other.carbonFootprint;
  }
}

/** Generic Extensions */

extension ListUtils<T> on List<T> {
  int get doubleLength => length * 2;
  List<T> reversedList() => reversed.toList();
}

/** Static Methods in Extensions */
extension StringExtensions on String {
  static bool isValidEmail(String email) {
    return email.contains('@');
  }
}


void main() {
  /** Adding a Method to String */
  print('42'.parseInt().runtimeType); // Output: 42

  /** EXTENSION ON ENUM */
  print(Vehicle.bicycle.isTwoWheeled); // Output: true
  print(Vehicle.car.carbonFootprint);  // Output: 80

  /** Boolean-Based Comparison for Enum */
  print(Vehicle.bicycle.hasLowerCarbonFootprintThan(Vehicle.car)); // true
  print(Vehicle.car.hasLowerCarbonFootprintThan(Vehicle.bus)); // false

  /** Generic Extensions */
  List<int> numbers = [1, 2, 3, 4];
  print("NUMBERS DOUBLE LENGTH = ${numbers.doubleLength}, NUMBERS REVERSED = ${numbers.reversedList()}"); // Output: [4, 3, 2, 1]
  
  /** Static Methods in Extensions */
  print(StringExtensions.isValidEmail('test@example.com')); // true
}