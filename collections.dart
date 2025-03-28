import 'package:intl/intl.dart';

String pickToughestKid() {
  return "Mike"; // Some logic to select a player
}

class Line implements Comparable<Line> {
  final int length;
  const Line(this.length);

  @override
  int compareTo(Line other) => length - other.length;
}

class Person {
  final String firstName, lastName;

  Person(this.firstName, this.lastName);

  // Override hashCode using the static hashing methods
  // provided by the `Object` class.
  @override
  int get hashCode => Object.hash(firstName, lastName);

  // You should generally implement operator `==` if you
  // override `hashCode`.
  @override
  bool operator ==(Object other) {
    return other is Person &&
        other.firstName == firstName &&
        other.lastName == lastName;
  }
}

class FooException implements Exception {
  final String? msg;

  const FooException([this.msg]);

  @override
  String toString() => msg ?? 'FooException';
}
void main(){
  /** LIST */
  // Create an empty list of strings.
  var grains = <String>[];
  print(grains.isEmpty);

  // Create a list using a list literal.
  var fruits = ['apples', 'oranges'];

  // Add to a list.
  fruits.add('kiwis');

  // Add multiple items to a list.
  fruits.addAll(['grapes', 'bananas']);

  // Get the list length.
  print(fruits.length == 5);
  // Get the list .
  print("fruits = ${fruits}");

  // Remove a single item.
  var appleIndex = fruits.indexOf('apples');
  fruits.removeAt(appleIndex);
  print(fruits.length == 4);
  print("fruits1 = ${fruits}, index of apples = ${fruits.indexOf('grapes')}");
  // Remove all elements from a list.
  fruits.clear();
  print(fruits.isEmpty);

  // You can also create a List using one of the constructors.
  var vegetables = List.filled(99, 'broccoli');
  // for (var vegetable in vegetables) {
  //     print(vegetable);
  // }
  // vegetables.forEach(print);

  print(vegetables.every((v) => v == 'broccoli'));

  //Sort
  var fruits1 = ['bananas', 'apples', 'oranges'];

  // Sort a list.
  //asc
   fruits1.sort((a, b) => a.compareTo(b));
  //desc
  fruits1.sort((a, b) => b.compareTo(a));
  print(fruits1);
  print(fruits1[0] == 'apples');

  var fruits2 = []; //DEFAULT DYNAMIC

  fruits2.add('apples');
  fruits2.add(1);
  fruits2.forEach(print);

  /** SETS */
  // Create an empty set of strings.
  var ingredients = <String>{};

  // Add new items to it.
  ingredients.addAll(['gold', 'titanium', 'xenon']);
  print(ingredients);
  print(ingredients.length == 3);

  // Adding a duplicate item has no effect.
  ingredients.add('gold');
  print(ingredients);
  print(ingredients.length == 3);

  // Remove an item from a set.
  ingredients.remove('gold');
  print(ingredients);
  print(ingredients.length == 2);

  // You can also create sets using
  // one of the constructors.
  var atomicNumbers = Set.from([79, 22, 54]);
  print(atomicNumbers);

  // Check whether an item is in the set.
  print(ingredients.contains('titanium'));

  // Check whether all the items are in the set.
  print(ingredients.containsAll(['titanium', 'xenon', 'gold']));

  // Create the intersection of two sets.
  var nobleGases = Set.from(['xenon', 'argon']);
  var intersection = ingredients.intersection(nobleGases);
  print(intersection.contains('argon'));
  print(intersection.contains('xenon'));

  /** MAPS */
  // Maps often use strings as keys.
  var hawaiianBeaches = {
    'Oahu': ['Waikiki', 'Kailua', 'Waimanalo'],
    'Big Island': ['Wailea Bay', 'Pololu Beach'],
    'Kauai': ['Hanalei', 'Poipu'],
  };
  
  hawaiianBeaches.forEach((k, v) => print('${k}: ${v}'));

  // Maps can be built from a constructor.
  var searchTerms = Map<int, String>();
  searchTerms = {5: 'Jupiter', 6: 'Saturn'};
  // searchTerms.addEntries({5: 'Jupiter', 6: 'Saturn'}.entries);
  searchTerms.forEach((k, v) => print('${k}: ${v}'));
  print(searchTerms[5]);
  // Maps are parameterized types; you can specify what
  // types the key and value should be.
  var nobleGasesV1 = Map<int, String>();

    // Check whether a map contains a key.
  print(hawaiianBeaches.containsKey('Oahu'));

  // Remove a key and its value.
  hawaiianBeaches.remove('Oahu');
  print(hawaiianBeaches.containsKey('Oahu'));


  // Get all the keys as an unordered collection
  // (an Iterable).
  var keys = hawaiianBeaches.keys;

  print(keys);
  print(Set.from(keys).contains('Oahu'));

  // Get all the values as an unordered collection
  // (an Iterable of Lists).
  var values = hawaiianBeaches.values;
  print(values);
  print(values.any((v) => v.contains('Wailea Bay')));
  print(keys.any((v) => v.contains('Big Island')));
  print(hawaiianBeaches.containsKey('Kauai'));

   var teamAssignments = <String, String>{};
   var teamAssignments1 = <String, String>{};
  // Trying again - 'Catcher' already exists, so it does nothing

  teamAssignments.putIfAbsent('Catcher', () =>  pickToughestKid());

  print(teamAssignments); // ✅ Output: {Catcher: John}


  // Assigning a value only if 'Catcher' is NOT in the map
  teamAssignments1.putIfAbsent('Catcher', () => 'John');
  print(teamAssignments1); // ✅ Output: {Catcher: John} (still the same)

  /** COMMON COLLECTION METHODS */
  var coffees = <String>[];
  var teas = ['green', 'black', 'chamomile', 'earl grey'];
  print(coffees.isEmpty);
  print(teas.isNotEmpty);

  print(teas);
  var loudTeas = teas.map((tea) => tea.toUpperCase()).toList();
  print(loudTeas);

  // Chamomile is not caffeinated.
  bool isDecaffeinated(String teaName) => teaName == 'chamomile';

  // Use where() to find only the items that return true
  // from the provided function.
  var decaffeinatedTeas = teas.where((tea) => isDecaffeinated(tea));
  // or teas.where(isDecaffeinated)

  // Use any() to check whether at least one item in the
  // collection satisfies a condition.
  print(teas.any(isDecaffeinated));

  // Use every() to check whether all the items in a
  // collection satisfy a condition.
  print(!teas.every(isDecaffeinated));

  /** URI's */
  var uri = 'https://example.org/api?foo=some message';

  var encoded = Uri.encodeFull(uri);
  print(encoded);

  var decoded = Uri.decodeFull(encoded);
  print(decoded);

  var uri1 = 'https://example.org/api?foo=some message';

  var encoded1 = Uri.encodeComponent(uri1);
  print(encoded1);

  var decoded1 = Uri.decodeComponent(encoded);
  print(decoded);

  /** Parsing URIs */
  var uri2 = Uri.parse('https://example.org:8080/foo/bar#frag');

  print(uri2.scheme);
  print(uri2.host);
  print(uri2.path);
  print(uri2.fragment);
  print(uri2.origin);

  /** Building URIs */
  var uri3 = Uri(
    scheme: 'https',
    host: 'example.org',
    path: '/foo/bar',
    fragment: 'frag',
    queryParameters: {'lang': 'dart', 'name' : 'kevin'},
  );
  print(uri3);

  var httpUri = Uri.http('example.org', '/foo/bar', {'lang': 'dart'});
  var httpsUri = Uri.https('example.org', '/foo/bar', {'lang': 'dart'});
  print(httpUri);
  print(httpsUri);

  /** Dates and times */
  // Get the current date and time.
  var now = DateTime.now();
  print(now);

  // Create a new DateTime with the local time zone.
  var y2k = DateTime(2000); // January 1, 2000
  print(y2k);
  // Specify the month and day.
  y2k = DateTime(2000, 1, 2); // January 2, 2000
  print(y2k);
  // Specify the date as a UTC time.
  y2k = DateTime.utc(2000); // 1/1/2000, UTC
  print(y2k);
  // Specify a date and time in ms since the Unix epoch.
  y2k = DateTime.fromMillisecondsSinceEpoch(946684800000, isUtc: true);
  print(y2k);
  // Parse an ISO 8601 date in the UTC time zone.
  y2k = DateTime.parse('2000-01-01T00:00:00Z');
  print(y2k);
  // Create a new DateTime from an existing one, adjusting just some properties:
  var sameTimeLastYear = now.copyWith(year: now.year - 1);
  print(sameTimeLastYear);

  y2k = DateTime.utc(2000);
  print(y2k);
  // Add one year.
  var y2001 = y2k.add(const Duration(days: 366));
  print(y2001.year);

  // Subtract 30 days.
  var december2000 = y2001.subtract(const Duration(days: 30));
  print(december2000.year);
  print(december2000.month);

  // Calculate the difference between two dates.
  // Returns a Duration object.
  var duration = y2001.difference(y2k);
  print(duration.inDays); // y2k was a leap year.

  DateTime now1 = DateTime.now();

  // Different formats
  String formatted1 = DateFormat('yyyy-MM-dd').format(now1);  // 2025-03-25
  String formatted2 = DateFormat('dd/MM/yyyy').format(now1);  // 25/03/2025
  String formatted3 = DateFormat('MMMM d, yyyy').format(now1); // March 25, 2025
  String formatted4 = DateFormat('yyyy-MM-dd HH:mm:ss').format(now1); // 2025-03-25 14:30:00

  print(formatted1);
  print(formatted2);
  print(formatted3);
  print(formatted4);

  /** Utility classes */
    // Comparing objects

  var short = const Line(1);
  var long = const Line(100);
  print("${short.length} ${long.length}");
  print(short.compareTo(long) < 0);
    // Implementing map keys
  
  var p1 = Person('Bob', 'Smith');
  var p2 = Person('Bob', 'Smith');
  var p3 = 'not a person';
  print(p1.hashCode == p2.hashCode);
  print(p1 == p2);
  print(p1 != p3);

    // Exceptions
  try {
    throw FooException('WTF');
  } catch (e) {
    print('Exception Occured: ${e}');
  }
}