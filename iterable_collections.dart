bool predicate(String item) {
  return item.length > 5;
}

// Implement the predicate of singleWhere
  // with the following conditions
  // * The element contains the character `'a'`
  // * The element starts with the character `'M'`
  bool predicateFunc(String item){
    return item.contains('a') && item.startsWith('M');
  }
  String singleWhere(Iterable<String> items) {
    return items.singleWhere(predicateFunc);
  }

  bool isLengthGreater(List<String> items) {
    return items.every((item) => item.length >= 5);
  }

  bool anyUserUnder18(Iterable<User> users) {
   return users.any((user) => user.age < 18);
}

bool everyUserOver13(Iterable<User> users) {
    return users.every((user) => user.age > 13);
}

Iterable<String> getNameAndAges(Iterable<User> users) {
  return users.map((user) => "${user.name} is ${user.age}");
}

class User {
  final String name;
  final int age;

  User(
    this.name,
    this.age,
  );
}
void main(){
  /** ITERABLE - IS AN ABSTRACT CLASS CANT INSTATIATE */
  Iterable<int> iterable = [1, 2, 3];
  int value = iterable.elementAt(1);
  // int value1 = iterable[1]; // ERROR
  print(value);

  const iterable1 = ['Salad', 'Popcorn', 'Toast'];
  for (final element in iterable1) {
    print(element);
  }

  /** USING FIRST AND LAST */
   Iterable<String> iterable2 = const ['Salad', 'Popcorn', 'Toast'];
  print('The first element is ${iterable2.first}');
  print('The last element is ${iterable2.last}');

  /** FIRSTWHERE() */
  String element = iterable1.firstWhere((element) => element.length > 5);
  print(element);

    const items = ['Salad', 'Popcorn', 'Toast', 'Lasagne'];

  // You can find with a simple expression:
  var foundItem1 = items.firstWhere((item) => item.length > 5);
  print(foundItem1);

  // Or try using a function block:
  var foundItem2 = items.firstWhere((item) {
    return item.length > 5;
  });
  print(foundItem2);

  // Or even pass in a function reference:
  var foundItem3 = items.firstWhere(predicate);
  print(foundItem3);

  // You can also use an `orElse` function in case no value is found!
  var foundItem4 = items.firstWhere(
    (item) => item.length > 10,
    orElse: () => 'None!',
  );
  print(foundItem4);

  /** SINGLEWHERE */
  
  const items1 = [
    'Salad',
    'Popcorn',
    'Milk',
    'Toast',
    'Sugar',
    'Mozzarella',
    'Tomato',
    'Egg',
    'Water',
  ];

  try {
    final str = singleWhere(items1);
    if (str == 'Mozzarella') {
      print('Success. All tests passed!');
    } else {
      print(
        'Tried calling singleWhere, but received $str instead of '
        'the expected value \'Mozzarella\'',
      );
    }
  } on StateError catch (stateError) {
    print(
      'Tried calling singleWhere, but received a StateError: ${stateError.message}. '
      'singleWhere will fail if 0 or many elements match the predicate.',
    );
  } on UnimplementedError {
    print(
      'Tried running `singleWhere`, but received an error. '
      'Did you implement the function?',
    );
  } catch (e) {
    print('Tried calling singleWhere, but received an exception: $e');
  }

  /** Checking conditions */
  var isAllGreaterThan5 = isLengthGreater(items);
  print(isAllGreaterThan5);

  if (items.any((item) => item.contains('a'))) {
    print('At least one item contains "a"');
  }

  if (items.every((item) => item.length >= 5)) {
    print('All items have length >= 5');
  }

  if (items.any((item) => item.contains('Z'))) {
    print('At least one item contains "Z"');
  } else {
    print('No item contains "Z"');
  }


  final users = [
    User('Alice', 21),
    User('Bob', 17),
    User('Claire', 52),
    User('David', 14),
  ];

  try {
    final out = anyUserUnder18(users);
    if (!out) {
      print('Looks like `anyUserUnder18` is wrong. Keep trying!');
      return;
    }
  } on UnimplementedError {
    print(
      'Tried running `anyUserUnder18`, but received an error. '
      'Did you implement the function?',
    );
    return;
  } catch (e) {
    print('Tried running `anyUserUnder18`, but received an exception: $e');
    return;
  }

  try {
    // with only one user older than 18, should be false
    final out = anyUserUnder18([User('Alice', 21)]);
    if (out) {
      print(
          'Looks like `anyUserUnder18` is wrong. What if all users are over 18?');
      return;
    }
  } on UnimplementedError {
    print(
      'Tried running `anyUserUnder18`, but received an error. '
      'Did you implement the function?',
    );
    return;
  } catch (e) {
    print(
      'Tried running `anyUserUnder18([User("Alice", 21)])`, '
      'but received an exception: $e',
    );
    return;
  }

  try {
    final out = everyUserOver13(users);
    if (!out) {
      print(
        'Looks like `everyUserOver13` is wrong. '
        'There are no users under 13!',
      );
      return;
    }
  } on UnimplementedError {
    print(
      'Tried running `everyUserOver13`, but received an error. '
      'Did you implement the function?',
    );
    return;
  } catch (e) {
    print(
      'Tried running `everyUserOver13`, '
      'but received an exception: $e',
    );
    return;
  }

  try {
    final out = everyUserOver13([User('Dan', 12)]);
    if (out) {
      print(
        'Looks like `everyUserOver13` is wrong. '
        'There is at least one user under 13!',
      );
      return;
    }
  } on UnimplementedError {
    print(
      'Tried running `everyUserOver13`, but received an error. '
      'Did you implement the function?',
    );
    return;
  } catch (e) {
    print(
      'Tried running `everyUserOver13([User(\'Dan\', 12)])`, '
      'but received an exception: $e',
    );
    return;
  }

  print('Success. All tests passed!');

  // Filtering
  const numbers = [1,2,3,4,5,6,7,-8,9,0,11,12];
  var evenNumbers = numbers.where((number) => number.isEven).toList();
  print(evenNumbers);
  for (final number in evenNumbers) {
    print('$number is even');
  }

  var negativeNumbers = numbers.where((number) => number.isNegative).toList();
  print(negativeNumbers);

  /**  Using takeWhile */
  var numbersUntilZero = numbers.takeWhile((number) => number != 0);
  print('Numbers until 0: $numbersUntilZero');

  var numbersStartingAtZero = numbers.skipWhile((number) => number != 0);
  print('Numbers starting at 0: $numbersStartingAtZero');

  var numbersUntilNegative = numbers.takeWhile(
    (number) => !number.isNegative,
  );

  print('Numbers until first negative: $numbersUntilNegative');

  /** Mapping */
  Iterable<int> output = numbers.map((number) => number * 10);
  print(output);
  Iterable<String> output1 = numbers.map((number) => number.toString());
  // output1.forEach((string) => print(string.runtimeType));
  print(output1);

  var result = getNameAndAges(users).toList();
  print(result);
}