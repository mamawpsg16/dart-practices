void example(){

  /** FINAL */
  final name = 'Bob'; // Without a type annotation
  final String nickname = 'Bobby';
  // name = 'Alice'; // Error: a final variable can only be set once.
  // nickname = 'Bobby'; // Error: a final variable can only be set once.
  print(name);
  print(nickname);

  // final bar1 = const []; // bar is immutable, and list is immutable
  // bar1.add(1); // ❌ Error! Can't modify a const list
  // bar1 = [1, 2, 3]; // ❌ Error! Can't assign a new list to `final` variable


  /** CONST */
  const bar = 1000000; // Unit of pressure (dynes/cm2)
  const double atm = 1.01325 * bar; // Standard atmosphere
  print(bar);
  print(atm);

  var foo = const []; // foo is mutable, but the list is immutable
  foo = [1, 2, 3]; // ✅ Allowed (new list assigned to foo)
  foo.add(4); // ✅ Allowed now, because it's a new non-const list
  print(foo);

  // var foo2 = const [5, 6, 7]; 
  // foo2.add(8); // ❌ Error! foo2 is holding a constant list
  // const baz = []; 
  // baz = [42]; // ❌ Error: Cannot assign to a `const` variable

  /** Type Checking and Spread Operator in const */
  const Object i = 3; // `i` is a `const` Object with an int value

  const list = [i as int]; // Typecast `i` as `int`
  const map = {if (i is int) i: 'int'}; // Use `is` for conditionally adding items
  const set = {if (list is List<int>) ...list}; // Use spread operator

  print(list); // [3]
  print(map); // {3: 'int'}
  print(set); // {3}

  const baz = []; // Fully immutable list
  // baz.add(1); // ❌ Error! Can't modify a const list
  // baz = [1, 2, 3]; // ❌ Error! Can't assign a new list

}

class Physics {
  static const double gravity = 9.8; // Shared constant value
}