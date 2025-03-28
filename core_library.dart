void main(){
  print(int.parse('42'));
  print(num.parse('42') is int);
  print(num.parse('0x42') is int);
  print(num.parse('0.50') is double);
  print(42.toString() == '42');
  print(123.456.toString() == '123.456');
  print(123.456.toStringAsFixed(2) == '123.46');
  // Check whether a string contains another string.
  print('Never odd or even'.contains('odd'));
  // Does a string start with another string?
  print('Never odd or even'.startsWith('Never'));

  // Does a string end with another string?
  print('Never odd or even'.endsWith('even'));

  // Find the location of a string inside a string.
  print('Never odd or even'.indexOf('odd') == 6);

  /** Extracting data from a string */
  // Grab a substring.
  print('Never odd or even'.substring(6, 9) == 'odd');

  // Split a string using a string pattern.
  var parts = 'progressive web apps'.split(' ');
  print(parts.length == 3);
  print(parts[0] == 'progressive');

  // Get a UTF-16 code unit (as a string) by index.
  print('Never odd or even'[0] == 'N');

  // Use split() with an empty string parameter to get
  // a list of all characters (as Strings); good for
  // iterating.
  for (final char in 'hello'.split('')) {
    print(char);
  }

  // Get all the UTF-16 code units in the string.
  var codeUnitList = 'Never odd or even'.codeUnits.toList();
  print(codeUnitList[0] == 78);

  /** Converting to uppercase or lowercase */
  // Convert to uppercase.
  print('web apps'.toUpperCase() == 'WEB APPS');

  // Convert to lowercase.
  print('WEB APPS'.toLowerCase() == 'web apps');

  /** Trimming and empty strings */
  // Trim a string.
  print('  hello  '.trim() == 'hello');

  // Check whether a string is empty.
  print(''.isEmpty);

  // Strings with only white space are not empty.
  print('  '.isNotEmpty);

  /** Replacing part of a string */
  const string = 'Dart is fun';
  print(string.substring(0, 4)); // 'Dart'
  print(string);

  var greetingTemplate = 'Hello, NAME!';
  var greeting = greetingTemplate.replaceAll(RegExp('NAME'), 'Bob');

  // greetingTemplate didn't change.
  print(greeting != greetingTemplate);

  /** Building a string */
  var sb = StringBuffer();
  sb..write('Use a StringBuffer for ')
  ..writeAll(['efficient', 'string', 'creation'], ' ')
  ..write('.');

  var fullString = sb.toString();

  print(fullString);

  /** Regular expressions */
  // Here's a regular expression for one or more digits.
  var digitSequence = RegExp(r'\d+');

  var lettersOnly = 'llamas live fifteen to twenty years';
  var someDigits = 'llamas live 15 to 20 years';
  var someDigits1 = 'llamas live ab to fs years';

  // contains() can use a regular expression.
  print(!lettersOnly.contains(digitSequence));
  print(someDigits.contains(digitSequence));

  // Replace every match with another string.
  var exedOut = someDigits.replaceAll(digitSequence, 'XX');
  print(exedOut);


  // Check whether the reg exp has a match in a string.
  print(digitSequence.hasMatch(someDigits1));

  // Loop through all matches.
  for (final match in digitSequence.allMatches(someDigits)) {
    print(match.group(0)); // 15, then 20
  }
}