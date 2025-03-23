void example(){
  print("-------------- CONTROLFLOW STATEMENTS --------------");
  int year = 1999;
  List<String> flybyObjects = ['Jupiter', 'Saturn', 'Uranus', 'Neptune'];
  Map<String, int> scores = {
    'Alice': 90,
    'Bob': 85,
    'Charlie': 88,
  };

  // If-Else statement
  // if (year >= 2001) {
  //   print('21st century');
  // } else if (year >= 1901) {
  //   print('20th century');
  // }

  // For-in loop
  // print("Flyby objects:");
  // for (final object in flybyObjects) {
  //   print(object);
  // }

  // for (final entry in scores.entries) {
  //   print('${entry.key}: ${entry.value}');
  // }

  // For loop
  // print("Months of the year:");
  // for (int month = 1; month <= 12; month++) {
  //   print(month);
  // }

  // While loop
  // while (year < 2016) {
  //   year += 1;
  // }
  // print("Year after loop: $year");


  // Break
  for (int i = 1; i <= 5; i++) {
    if (i == 3) {
      print('Breaking at $i');
      break; // Stops the loop at i == 3
    }
    print(i);
  }

  // Continue
  for (int i = 1; i <= 5; i++) {
    if (i == 3) {
      print('Skipping $i');
      continue; // Skips 3 and continues the loop
    }
    print(i);
  }

  // Switch
  // String grade = 'B';

  // switch (grade) {
  //   case 'A':
  //     print('Excellent!');
  //     break;
  //   case 'B':
  //     print('Good job!');
  //     break;
  //   case 'C':
  //     print('You can do better.');
  //     break;
  //   default:
  //     print('Invalid grade.');
  // }

  // String command = 'close';

  // switch (command) {
  //   case 'open':
  //   case 'start':
  //     print('Starting...');
  //     break;
  //   case 'close':
  //     print('Closing...');
  //     continue stopLabel; // Jump to the labeled case
  //   stopLabel:
  //   case 'stop':
  //     print('Stopped.');
  //     break;
  //   default:
  //     print('Unknown command.');
  // }

}