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


