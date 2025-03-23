void printType(Object obj) {
  switch (obj) {
    case int():
      print('It’s an int!');
    case String():
      print('It’s a String!');
    default:
      print('Unknown type');
  }
}


class Foo {
  final String one;
  final int two;
  Foo({required this.one, required this.two});
}

void main() {
  /** Matching */
  print("\n--- MATCHING ---");
  printType(42);      // Output: It’s an int!
  printType('Dart');  // Output: It’s a String!

/** Destructuring */
print("\n--- DESTRUCTURING ---");
  var myList = [1, 2, 3];
  var [a, b, c] = myList; // Destructuring the list

  print(a); // 1
  print(b); // 2
  print(c); // 3

  var user = {'name': 'Alice', 'age': 30};

  var {'name': name, 'age': age} = user; // Extracting map values

  print(name); // Alice
  print(age);  // 30

  var list = ['C', 99];

  var result = switch (list) {
    ['a', var c] => c,
    ['b', var c] => c,
    _ => 'Unknown'
  };

  print(result); // 99

  var list2 = ['a', 42];

  switch (list2) {
    case ['a', var c]:
    case ['b', var c]:  // ✅ Correct way to handle 'a' OR 'b'
      print(c);
  }

  /** Places Patterns Can Appear */
  print("\n--- PLACES PATTERNS CAN APPEAR ---");
  var (x, y) = (10, 20); // Tuple destructuring
  print(x); // 10
  print(y); // 20

  // Variable Assignment
  int x1, y1; // Declare variables first
  (x1, y1) = (3, 4); // Assign values using pattern assignment

  print("$x1, $y1"); // 3, 4

  // ✅ Destructuring in a for-loop

  var pairs = [(1, 'one'), (2, 'two'), (3, 'three')];

  for (var (num, text) in pairs) {
    print('$num -> $text');
  }

   var value = (1, "one");

  if (value case (var number, var text)) {
    print('$number -> $text'); // 1 -> one
  }

   var shape = ('circle', 10);

  switch (shape) {
    case ('circle', var radius):
      print('Circle with radius $radius');
    case ('square', var side):
      print('Square with side $side');
    default:
      print('Unknown shape');
  }

  var list1 = ['apple', 'banana', 'cherry'];

  var result1 = [
    for (var fruit in list1)
      if (fruit case 'apple') '🍏'
      else if (fruit case 'banana') '🍌'
      else '🍒'
  ];

  print(result1); // ['🍏', '🍌', '🍒']

  // Declares new variables a, b, and c.
  var (a1, [b1, c1]) = ('str', [1, 2]);

  // Correct way to print all values
  print('$a1 $b1 $c1'); // Output: str 1 2

  var (a2, b2) = ('left', 'right');
  (b2, a2) = (a2, b2); // Swap.
  print('$a2 $b2'); // Prints "right left".

  final myFoo = Foo(one: 'Hello', two: 42);
  
  var Foo(:one, :two) = myFoo;
  print('$one, $two'); // Hello, 42

  int obj = 15; // Change Object to int
  
  switch (obj) {
    case 1:
      print('It is one');
      break;
      
    case >= 10 && <= 20: // Now valid because obj is an int
      print('It is between 10 and 20');
      break;
      
    default:
      print('Unknown');
  }

  Map<String, int> hist = {'a': 23, 'b': 100};

  for (var MapEntry(key: key, value: count) in hist.entries) {
    print('$key occurred $count times');
  }
}

// Transaction class representing different transaction types
sealed class Transaction {}

class Deposit extends Transaction {
  final double amount;
  Deposit(this.amount);
}

class Withdrawal extends Transaction {
  final double amount;
  Withdrawal(this.amount);
}

class Transfer extends Transaction {
  final double amount;
  final String recipient;
  Transfer(this.amount, this.recipient);
}

void processTransaction(Transaction transaction) {
  switch (transaction) {
    case Deposit(amount: >= 5000) || Transfer(amount: >= 5000, recipient: _):
      print('High-value transaction alert!');

    case Withdrawal(amount: > 100 && < 500):
      print('Processing standard withdrawal.');

    case Deposit(amount: < 1):
      print('Micro-deposit detected.');

    case Transfer(amount: var amt, recipient: var name):
      print('Transfer of \$${amt} to $name.');

    case Deposit(amount: 1000):
      print('Deposit of \$1000 received.');

    case Withdrawal(amount: var amt):
      print('Withdrawing \$${amt}.');

    case _:
      print('Unknown transaction type.');
  }
}
