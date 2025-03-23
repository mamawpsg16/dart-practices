void example() {
  // ✅ 1. Defining and Using Records
  var record = ('first', a: 2, b: true, 'last');
  print(record.$1); // Prints 'first'
  print(record.a); // Prints 2
  print(record.b); // Prints true
  print(record.$2); // Prints 'last'

  // ✅ 2. Function Returning a Record
  (int, int) swap((int, int) record) {
    var (a, b) = record;
    return (b, a);
  }

  var swapped = swap((3, 4));
  print(swapped); // (4, 3)

  // Record type annotation in a variable declaration:
  ({int a, bool b}) record1;

  // Initialize it with a record expression:
  record1 = (a: 123, b: true);

  print(" RECORD 1${record1.a}"); // 123
  print(" RECORD 2${record1.a}"); // 123
  
  // ✅ 3. Named Record Fields
  ({int a, bool b}) namedRecord = (a: 123, b: true);
  print(namedRecord.a); // 123
  print(namedRecord.b); // true

  // ✅ 4. Function Returning a Named Record
  ({String name, int age}) getUserInfo() {
    return (name: 'Alice', age: 25);
  }


  (int a, int b) recordAB = (1, 2);
  (int x, int y) recordXY = (3, 4);
  print(recordAB = recordXY); // (3,4)

  (num, Object) pair = (42, 'a');

  (String, String, {int a, bool b})  record2 = ('first', 'last', a: 2, b: true);
  print(record2);

  var first = pair.$1; // Static type `num`, runtime type `int`.
  var second = pair.$2; // Static type `Object`, runtime type `String`.
  print(first);
  print(second);

  (int x, int y, int z) point = (1, 2, 3);
  (int r, int g, int b) color = (1, 2, 3);

  print(point == color); // Prints 'true'.

  var user = getUserInfo();
  print(user.name); // Alice
  print(user.age); // 25

  // ✅ 5. Using Records to Return Multiple Values
  (String, int) fetchUserInfo() {
    return ('John', 30);
  }

  var (name, age) = fetchUserInfo();
  print('Name: $name, Age: $age');

  // ✅ 6. List of Records
  List<({String label, int id})> items = [
    (label: 'Item 1', id: 1),
    (label: 'Item 2', id: 2),
  ];

  for (var item in items) {
    print('${item.label} - ${item.id}');
  }

  /** MULTILPLE RETURNS */
  // Returns multiple values in a record:
  (String name, int age) userInfo(Map<String, dynamic> json) {
    return (json['name'] as String, json['age'] as int);
  }

  final json = <String, dynamic>{'name': 'Dash', 'age': 10, 'color': 'blue'};

  // Destructures using a record pattern with positional fields:
  var (name2, age2) = userInfo(json);
  print(name2); // Dash
  print(age2); // 10

 ({String namev2, int agev2}) userInfoV2(Map<String, dynamic> json) {
  return (namev2: json["name"], agev2: json["age"]);
}

  final (:namev2, :agev2) = userInfoV2(json);
  print(namev2); // Dash
  print(agev2); // 10


  /* Equivalent to:
    var info = userInfo(json);
    var name = info.$1;
    var age  = info.$2;
  */


  final List<({String label, void Function()? onPressed})> buttons = [
    (
      label: "Button I",
      onPressed: () => print("Action -> Button I"),
    ),
    (
      label: "Button II",
      onPressed: () => print("Action -> Button II"),
    )
  ];

  buttons.forEach((button) {
    print(button.label);
    button.onPressed?.call(); // ✅ Safe call in case it's null
  });

}

void main() {
  example();
}
