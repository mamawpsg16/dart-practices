enum OrderStatus {
  pending,
  shipped,
  delivered,
  cancelled;

  String get message {
    switch (this) {
      case OrderStatus.pending:
        return 'Your order is pending.';
      case OrderStatus.shipped:
        return 'Your order has been shipped.';
      case OrderStatus.delivered:
        return 'Your order has been delivered.';
      case OrderStatus.cancelled:
        return 'Your order has been cancelled.';
    }
  }
}


// Define a supporting enum for planet types
enum PlanetType { terrestrial, gas, ice }

// Enhanced Enum for planets
enum Planet {
  mercury(planetType: PlanetType.terrestrial, moons: 0, hasRings: false),
  venus(planetType: PlanetType.terrestrial, moons: 0, hasRings: false),
  earth(planetType: PlanetType.terrestrial, moons: 1, hasRings: false),
  mars(planetType: PlanetType.terrestrial, moons: 2, hasRings: false),
  jupiter(planetType: PlanetType.gas, moons: 79, hasRings: true),
  saturn(planetType: PlanetType.gas, moons: 83, hasRings: true),
  uranus(planetType: PlanetType.ice, moons: 27, hasRings: true),
  neptune(planetType: PlanetType.ice, moons: 14, hasRings: true);

  // Constructor with required properties
  const Planet({
    required this.planetType,
    required this.moons,
    required this.hasRings,
  });

  // Properties
  final PlanetType planetType;
  final int moons;
  final bool hasRings;

  // Getter method to check if the planet is a giant
  bool get isGiant => planetType == PlanetType.gas || planetType == PlanetType.ice;
}

/** NORMAL ENUMS */
enum Color { red, green, blue }

/** Enhanced Enum with Fields & Methods */
enum Vehicle implements Comparable<Vehicle>{
  car(tires: 4, passengers: 5, carbonPerKilometer: 400),
  ebike(tires: 4, passengers: 5, carbonPerKilometer: 400),
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

  // Calculates carbon footprint per passenger
  int get carbonFootprint => (carbonPerKilometer / passengers).round();

  // Checks if it's a two-wheeled vehicle specifically a bicycle
  bool get isTwoWheeled => this == Vehicle.bicycle;

  @override
  int compareTo(Vehicle other) => carbonFootprint - other.carbonFootprint;

}

/**USING ENUM WITH INTERFACE */
abstract interface class Playable {
  void play();
}

enum Instrument implements Playable {
  guitar,
  piano,
  violin;

  @override
  void play() {
    print('Playing ${name.toUpperCase()}');
  }
}

/** REALWORLD USECASE */
enum UserRole {
  admin(permissionLevel: 3),
  editor(permissionLevel: 2),
  viewer(permissionLevel: 1);

  const UserRole({required this.permissionLevel});

  final int permissionLevel;
}

void main(){
  Color favoriteColor = Color.blue;

  print(favoriteColor);           // Output: Color.blue
  print(favoriteColor.index);     // Output: 2
  print(Color.values);            // Output: [Color.red, Color.green, Color.blue]

  // Using Enums in a switch statement
  switch (favoriteColor) {
    case Color.red:
      print("Red like a rose!");
      break;
    case Color.green:
      print("Green like grass!");
      break;
    case Color.blue:
      print("Blue like the sky!");
      break;
  }
  /** Enhanced Enum with Fields & Methods */
  print(Vehicle.car.tires);  // Output: 4
  print(Vehicle.bus.carbonFootprint);  // Output: 16
  print(Vehicle.bicycle.isTwoWheeled); // Output: true
  print(Vehicle.car.isTwoWheeled); // Output: false
  print(Vehicle.values.runtimeType); // Output: List<Vehicle>
  print(Vehicle.car.compareTo(Vehicle.ebike)); 

  /**USING ENUM WITH INTERFACE */
  Instrument.guitar.play();  // Output: Playing GUITAR

  /** REALWORLD USECASE */
  UserRole user = UserRole.editor;
  print(user.permissionLevel); // Output: 2
}

