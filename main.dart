import 'dart:math';
import 'greetings.dart' deferred as greetings show greetNamed, greetPositional;  // Import Everything EXCEPT Some Functions (hide)
import 'library.dart' as lib;
import 'variables.dart' as variables;
import 'controlflow_statements.dart' as controlflow;
import 'functions.dart' as functions;
import 'enums.dart';
import 'inheritance.dart';
import 'mixins.dart';
import 'abstract_classes.dart';
import 'interface_classes.dart';
import 'async.dart';
import 'exception.dart';
<<<<<<< HEAD

=======
import 'final_const.dart' as final_const;
import 'lazy_initialization.dart';
import 'wildcards.dart';
import 'operators.dart' as operators;
import 'metadata.dart' as metadata;
>>>>>>> 3a906cd (Reinitialized Git and linked to GitHub)
// import 'file.dart' show func1, func2;	//Import only specific functions
// import 'file.dart' hide func1;	//Import everything except func1
// import 'file.dart' as alias;	//Import with a namespace
import 'classes.dart' as classExample;
<<<<<<< HEAD
=======
import 'libraries_and_import.dart' as libraries_and_import;
import 'dart:async';
// Use relative import instead of package import
import 'libs/utils.dart' deferred as hello;
import 'builtin_types.dart' as builtin_types;

Future<void> greetUser() async {
  await hello.loadLibrary(); // Load utils.dart at runtime
  print(hello.greet("Maricar")); // Call greet function
}

>>>>>>> 3a906cd (Reinitialized Git and linked to GitHub)
void main() async {
   print("App Started 🚀");
  /** VARIABLE DECLARATIONS */
  variables.example();

  /** CONTROL FLOW STATEMENTS */
  controlflow.example();

  /** FUNCTIONS */
  functions.example();

  /** IMPORTS */
  var intValue = Random().nextInt(10); 
  print(intValue);
  
   // ✅ Load the module when needed
  await greetings.loadLibrary();
  print(greetings.greetNamed(name : "Alice"));
  print("App In-Process 🚀");
  print(lib.greetNamed());
  print(lib.greetPositional("Bob"));
  print(lib.greetPositional());
  print(lib.add(2, 3));
  
  /** CLASSES */
  classExample.Spacecraft spacecraft = classExample.Spacecraft('Voyager I', DateTime(1977, 9, 5));
  spacecraft.describe();
  classExample.Spacecraft voyager3 = classExample.Spacecraft.unlaunched('Voyager III');
  voyager3.describe();

/** ENUMS */
  print("-------------- ENUMS --------------");
  OrderStatus status = OrderStatus.shipped;
  print(status.message); // Output: Your order has been shipped.

   // Select a planet
  Planet myPlanet = Planet.jupiter;

  // Print details
  print('Planet: ${myPlanet.name}');
  print('Type: ${myPlanet.planetType}');
  print('Moons: ${myPlanet.moons}');
  print('Has Rings? ${myPlanet.hasRings}');
  print('Is a Giant? ${myPlanet.isGiant}');

  /** INHERITANCE */
  print("\n-------------- INHERITANCE --------------");
  Animal animal = Animal('Buldog', 'Black', "Dog");
  animal.eat();
  print(animal.breed);

  Dog dog = Dog('Buldog', 'Black', 'Blacky');
  dog.eat();
  dog.bark();
  print(dog.breed);

  /** MIXINS */
  print("\n-------------- MIXINS --------------");
  PilotedCraft pilotedCraft = PilotedCraft('Voyager I', DateTime(1977, 9, 5));
  pilotedCraft.describeCrew();

  /** ABSTRACT CLASSES */
  print("\n-------------- ABSTRACT CLASSES --------------");
  Payment payment1 = CreditCardPayment();
  payment1.processPayment(100.0);
  
  Payment payment2 = PayPalPayment();
  payment2.processPayment(50.0);

  /** INTERFACE CLASSES */
  print("\n-------------- INTERFACE CLASSES --------------");
   List<Notifiable> notifications = [
    SMSNotification(),
    EmailNotification(),
    PushNotification(),
  ];

  for (var notification in notifications) {
    notification.sendNotification("Your order has been shipped!");
  }

  /** ASYNC */
  print("\n-------------- ASYNC --------------");
<<<<<<< HEAD
  try {
    String data = await fetchUser();
    print('Data received: $data');
  } catch (e) {
    print('Error: $e');
  }

  /** EXCEPTION */
  print("\n-------------- EXCEPTION --------------");
  await fetchData();
=======
  // try {
  //   String data = await fetchUser();
  //   print('Data received: $data');
  // } catch (e) {
  //   print('Error: $e');
  // }

  /** EXCEPTION */
  print("\n-------------- EXCEPTION --------------");
  // await fetchData();

  /** FINAL & CONST */
  print("\n-------------- FINAL & CONST --------------");
  final_const.example();
  print(final_const.Physics.gravity); // 9.8

/**  LATE (LAZY INITIALIZATION) */
  print("Before accessing temperature");
  print(temperature); // Now readThermometer() runs because temperature is accessed.

  /** WILDCARDS */
  print("\n-------------- WILDCARDS --------------");
  repeatAction(3);
  safeOperation();

  var response = Response<String, int>("Success");
  processResponse(response);

  handleUserEvents((_, event) => print("Event: $event"));

  /** OPERATORS */
  print("\n-------------- OPERATORS --------------");
  operators.example();

  /** METADATA */
  print("\n-------------- METADATA --------------");
  metadata.example();

  /** LIBRARIES AND IMPORT */
  print("\n-------------- LIBRARIES AND IMPORT --------------");
  // libraries_and_import.example();
  // var p1 = libraries_and_import.PersonV1("Alice", 25);
  // print(p1.name);  // ✅ Works
  // print(p1._age);  // ❌ Error: '_age' is private to person.dart

  print("App started!");
  // await greetUser(); // Loads library and calls function

  /** BUILTIN TYPES */
  print("\n-------------- BUILTIN TYPES --------------");
  builtin_types.example();
>>>>>>> 3a906cd (Reinitialized Git and linked to GitHub)
}
