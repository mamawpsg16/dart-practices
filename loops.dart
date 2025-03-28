import 'dart:io';

class Candidate {
  final String name;
  final int yearsExperience;

  Candidate(this.name, this.yearsExperience);
}

class Point {
  final int x, y;
  Point(this.x, this.y);
}

enum Status { open, closed, pending }

void main(){
  /** FOR LOOPS */

  var message = StringBuffer('Dart is fun');
  for (var i = 0; i < 5; i++) {
    message.write('!');
  }

  print(message.toString());

  var callbacks = [];
  for (var i = 0; i < 2; i++) {
    callbacks.add(() => print(i));
  }

  for (final c in callbacks) {
    c();
  }

  /** FOR-IN - If you don't need the index */

  var candidates = ['Alice', 'Bob', 'Charlie'];

  for (final candidate in candidates) {
    print('$candidate is being interviewed.');
  }

  /** Pattern Matching in for-in Loop */
  var candidatesV1 = [
    Candidate('Alice', 5),
    Candidate('Bob', 3),
    Candidate('Charlie', 7),
  ];

  for (final Candidate(:name, :yearsExperience) in candidatesV1) {
    print('$name has $yearsExperience years of experience.');
  }

  /** USING FOREACH -  useful for inline operations */
  var collection = [1, 2, 3];
  collection.forEach(print); // ✅ Prints each element

  var candidatesV2 = ['Alice', 'Bob', 'Charlie'];

  candidatesV2.forEach((candidate) {
    print('$candidate is selected!');
  });

  /** WHILE AND DO-WHILE */
  /** WHILE */

  int money = 5;
  //If the user already has $5, the loop never runs.
  // If they don't have enough, it keeps asking.
  // while (money < 5) {  // ✅ Condition checked first
  //   stdout.write("Insert money (\$5 required): ");
  //   money = int.tryParse(stdin.readLineSync() ?? '0') ?? 0;
  // }

  // print("✅ Vending machine activated!");

  /** DO-WHILE */
  // The menu ALWAYS appears at least once, even if choice == 3 from the start.
  // The loop keeps running until the user enters 3 (Exit).
  int choice;

  // do {
  //   print("\n📜 MENU:");
  //   print("1. Start Game");
  //   print("2. Load Game");
  //   print("3. Exit");
  //   stdout.write("Enter choice: ");
  //   choice = int.tryParse(stdin.readLineSync() ?? '0') ?? 0;
  // } while (choice != 3);  // ✅ Condition checked AFTER running once

  // print("👋 Goodbye!");

  // String userResponse;
  // do {
  //   print('Downloading file...');
  //   stdout.write('Download another file? (y/n): ');
  //   userResponse = stdin.readLineSync()!.toLowerCase();
  // } while (userResponse == 'y');

  // print('All downloads completed.');

  /** BREAK */
  List<String> shoppingList = ['Milk', 'Bread', 'Eggs', 'Butter', 'Cheese'];

  String searchItem = 'Eggs';
  
  for (var item in shoppingList) {
    print('Checking: $item');
    if (item == searchItem) {
      print('$searchItem found in the shopping list!');
      break; // ✅ Stop searching once found
    }
  }

  /** CONTINUE */
  for (int i = 1; i <= 10; i++) {
    if (i % 2 == 0) {
      continue; // ✅ Skip even numbers
    }
    print(i);
  }

  /** LABELS */

  // - Why use a label? because break only stops the inner loop. Using a label allows us to exit both loops when we find the target number.
  List<List<int>> matrix = [
    [1, 2, 3],
    [4, 5, 6],
    [7, 8, 9]
  ];

  int target = 5;

  /** BREAK WITH LABELS */
  outerLoop: // ✅ Label to break from both loops
  for (var row in matrix) {
    for (var value in row) {
      print('Checking: $value');
      if (value == target) {
        print('$target found!');
        break outerLoop; // ✅ Exits both loops
      }
    }
  }

  /** CONTINUE WITH LABELS */
  outerLoop1: // 👈 Label for the outer loop
  for (int i = 1; i <= 3; i++) {
    if (i % 2 == 0) {
      continue outerLoop1; // ✅ Skip even numbers and go to the next outer loop iteration
    }

    for (var letter in ['A', 'B', 'C']) {
      print('$i - $letter');
    }
  }

  /** BRANCHES */
  var pair = [5, 10];

  if (pair case [int x, int y]) {
    print("Pair contains: $x and $y");
  } else {
    print("Invalid pair");
  }

  var point = Point(3, 4);

  switch (point) {
    case Point(x: var x, y: var y):
      print("Point is at ($x, $y)");
  }

  /** SWITCH WITH GUARDS (WHEN) */
  var userType = "premium";
  var purchaseAmount = 120;

  switch (userType) {
    case "premium" when purchaseAmount > 100:
      print("You get a 20% discount! 🎉");
    case "regular":
      print("You get a 10% discount.");
    default:
      print("No discount available.");
  }

  // Status status = Status.open;

  // switch (status) {
  //   case Status.open:
  //     print("Status: Open");
  //   case Status.closed:
  //     print("Status: Closed");
  //   // ⚠️ MISSING Status.pending → Dart will throw an error!
  // }
}