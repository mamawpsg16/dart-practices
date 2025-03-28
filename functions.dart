bool topLevel = true;

class A {
  static void bar() {} // Static method
  void baz() {} // Instance method
}

void example(){
  print("-------------- FUNCTIONS --------------");
   // int sum(int a, int b) {
  //   return a + b;
  // }

  // int sumShortHand(int a, int b) => a + b;

  // print(sum(2, 3)); // 5
  // print(sumShortHand(2, 3)); // 5

  // flybyObjects.where((name) => name.contains('turn')).forEach(print); // Shortcut for forEach((item) => print(item))

  // void greet({String name = 'Guest'}) {
  //   print('Hello, $name!');
  // }

  // greet(); // Hello, Guest!
  // greet(name: 'Alice'); // Hello, Alice!

  List<int> numbersV2 = [1,2,3,4,5];

  // // ✅ Works fine even if the list is empty
  int sum = numbersV2.fold(0, (a, b) => a + b);

  print(sum);


}

void main() async {
  Map<int, String> _nobleGases = {
    2: 'Helium',
    10: 'Neon',
    18: 'Argon',
    36: 'Krypton',
    54: 'Xenon',
    86: 'Radon',
  };
  
  bool isNoble(int atomicNumber) {
    return _nobleGases[atomicNumber] != null;
  }

  bool isNobleV2(int atomicNumber) => _nobleGases[atomicNumber] != null;

  print(isNoble(2)); // true
  print(isNoble(1)); // false
  print(isNobleV2(2)); // true
  print(isNobleV2(1)); // false

  /** Parameters */
  void enableFlags({bool? bold = false, required bool? hidden}) {
    print('bold: $bold, hidden: $hidden');
  }

  enableFlags(bold: true, hidden: null); // bold: true, hidden: null
  enableFlags(hidden: true); // bold: null, hidden: true
  enableFlags(bold: false, hidden: true); // bold: false, hidden: true

  /** Optional positional parameters */

  // String say(String from, String msg, [String? device]) {
  String say(String from, String msg, [String? device  = 'carrier pigeon']) {
    // var result = '$from says $msg';
    // if (device != null) {
    //   result = '$result with a $device';
    // }

    var result = '$from says $msg with a $device';
    return result;
  }

  print(say("Bob", "Howdy")); // Bob says Howdy
  print(say("Bob", "Howdy", "smoke signal")); // Bob says Howdy with a smoke signal

  /** Functions as first-class objects */
  void printElement(int element) {
    print(element);
  }

  var list = [1, 2, 3];

  // Pass printElement as a parameter.
  list.forEach(printElement);

  /** Function types */
  void greet(String name, {String greeting = 'Hello'}) =>
  print('$greeting $name!');

  // Store `greet` in a variable and call it.
  void Function(String, {String greeting}) g = greet;
  g('Dash', greeting: 'Howdy');

  void greet1(String name, [String greeting = 'Hello']) {
    print('$greeting $name!');
  }

  greet1('Dash', 'Hi');

  /** Anonymous functions */
  var list1 = ['apples', 'bananas', 'oranges'];
  // var uppercaseList =
  //   list1.map((item) {
  //   return item.toUpperCase();
  // }).toList();
  // // Convert to list after mapping

  // for (var item in uppercaseList) {
  //   print('$item: ${item.length}');
  // }

  // If the function contains only a single expression or return statement, you can shorten it using arrow notation
  var uppercaseList1 = list1.map((item) => item.toUpperCase()).toList();
  uppercaseList1.forEach((item) => print('$item: ${item.length}'));

  /** Lexical scope */
 var outerVar = 'I am from outer scope';

  void innerFunction() {
    print(outerVar); // ✅ Can access outerVar from main()
  }

  innerFunction(); // ✅ Calling the inner function

   var outerVar1 = 'I am from outer scope';

  void innerFunction1() {
    var innerVar = 'I am from inner scope';
    print(outerVar1); // ✅ Can access outerVar
    print(innerVar); // ✅ Can access innerVar
  }

  innerFunction1(); // ✅ Works fine

  // print(innerVar1); // ❌ ERROR: outerFunction cannot access innerVar

  /**  Lexical Closure */
  Function makeMultiplier(int multiplier) {
    return (int value) {
      return value * multiplier; // ✅ Uses multiplier even after makeMultiplier() exits
    };
  }
  
  var triple = makeMultiplier(3); // triple now "remembers" multiplier = 3
  print(triple(4)); // ✅ 4 * 3 = 12

  Function counter() {
    int count = 0; // This variable is "remembered" by the returned function
    return () {
      count++;
      return count;
    };
  }

  var increment = counter(); // ✅ Creates a new counter
  print(increment()); // ✅ Output: 1
  print(increment()); // ✅ Output: 2
  print(increment()); // ✅ Output: 3

  Function makeAdder(int addBy) {
    return (int i) => addBy + i;
  }

  // Create a function that adds 2.
  var add2 = makeAdder(2);

  // Create a function that adds 4.
  var add4 = makeAdder(4);

  print(add2(3));
  print(add4(3));

  /** Tear-offs */
  var charCodes = [68, 97, 114, 116];
  var buffer = StringBuffer();

  // Function tear-off
  charCodes.forEach(print);

  // Method tear-off
  charCodes.forEach(buffer.write);

  /**  Testing Function Equality */
  void foo() {} // Top-level function
  Function x = foo;
  assert(foo == x); // ✅ Same function reference


  Function x1 = A.bar;
  assert(A.bar == x1); // ✅ Same function reference
  

  var v = A(); // Instance #1
  var w = A(); // Instance #2
  var y = w;   // Reference to instance #2

  Function x2 = w.baz;

  assert(y.baz == x2); // ✅ Same instance (#2), so functions are equal
  assert(v.baz != w.baz); // ❌ Different instances, so functions are not equal

  /** Return values */
  foo1() {}

  num foofoo(num a, int b) {
    return a + b;
  }

  print(foofoo(2.5, 3)); // 5
  assert(foo1() == null);

  //RETURN MULTIPLE VALUES
  (String, int) foo2() {
    return ('something', 42);
  }
  print(foo2());

  /** Generators */
  // ✅ Synchronous Generators (sync*)
  // Returns a list of values that can be iterated over immediately.
  // Works well for small, finite data sets.
  Iterable<int> naturalsTo(int n) sync* {
    int k = 0;
    while (k < n) {
      yield k++; // Returns k and increments it
    }
  }

  for (var value in naturalsTo(5)) {
    print(value); // ✅ Output: 0 1 2 3 4
  }

  // ✅ Asynchronous Generators (async*)
  //Returns a stream of values that are emitted over time.
  // Works well for data that arrives asynchronously.
  Stream<int> asynchronousNaturalsTo(int n) async* {
    int k = 0;
    while (k < n) {
      yield k++; // Emits values asynchronously
      await Future.delayed(Duration(seconds: 1)); // Simulate delay
    }
  }

  await for (var value in asynchronousNaturalsTo(5)) {
    print(value); // ✅ Output: 0 (after 1 sec) 1 (after 1 sec) ... 4
  }

}

