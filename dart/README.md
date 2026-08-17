# Dart

> Dart is an approachable, portable, and productive language for high-quality
> apps on any platform.

---

## Hello, World

Similar to other languages, *Dart* has a `main` function:

```dart
void main() {
  print('Hello, world!');
}
```

## Types

*Dart* infers the types of most variables defined with `var`:

```dart
var name = 'Voyager I';  // String
var year = 1977;  // int
var antennaDiameter = 3.7;  // double
var flybyObjects = ['Jupiter', 'Saturn'];  // List
var image = {'url': '//path/to/saturn.jpg'};  // Map
var record = ('first', a: 2, b: true, 'last');  // Record

var setLiteral = {'item_a', 'item_b'};  // Set
var set = Set<String>{};  // Set
```

*Dart* variables are non-nullable by default. You must affix a
`?` after the type to make it nullable:

```dart
int? lineCount;
assert(lineCount == null);
```

If you wish to create a non-nullable variable that is initialized after
declaration, use the `late` keyword:

```dart
late String myString;

void main() {
  myString = 'Hello, world!';
  print(myString);
}
```

Attempting to use a `late` variable before assigning a value to it throws an
exception.

A `final` variable can only be set once, while a `const` is a compile-time
constant:

```dart
final onlyOnce = 'Hello';
const compileTime = 'World!';

void main() {
  print(onlyOnce);
  print(compileTime);
}
```

*Dart* supports placeholder values for variables which are not used:

```dart
var _ = 1;
int _ = 2;

// In loops
for (var _ in list) {}

// Generic types
class T<_> {}
void genericFunction<_>() {}

takeGenericCallback(<_>() => true);
```

**Note:** *Dart* considers the `Object` to refer to any type (`Object?` for any
nullable type).

## Control Flow

*Dart* supports `if`, `for`, and `while` loops, similar to other languages:

```dart
if (year >= 2001) {
  print('21st century');
} else if (year >= 1901) {
  print('20th century');
}

for (final object in flybyObjects) {
  print(object);
}

for (int month = 1; month <= 12; month++) {
  print(month);
}

while (year < 2016) {
  year += 1;
}
```

## Functions

Functions are declared with return types and parameter types:

```dart
int fibonacci(int n) {
  if (n == 0 || n == 1) return n;
  return fibonacci(n - 1) + fibonacci(n - 2);
}

var result = fibonacci(20);
```

A shorthand arrow (`=>`) syntax is used for single-statement functions:

```dart
flybyObjects.where((name) => name.contains('turn')).forEach(print);
```

## Comments

```dart
// This is a normal, one-line comment.

/// This is a documentation comment, used to document libraries,
/// classes, and their members. Tools like IDEs and dartdoc treat
/// doc comments specially.

/* Comments like these are also supported. */
```

## Imports

```dart
// Importing core libraries
import 'dart:math';

// Importing libraries from external packages
import 'package:test/test.dart';

// Importing files
import 'path/to/my_other_file.dart';
```

## Classes

```dart
class Spacecraft {
  String name;
  DateTime? launchDate;

  // Read-only non-final property
  int? get launchYear => launchDate?.year;

  // Constructor, with syntactic sugar for assignment to members
  Spacecraft(this.name, this.launchDate) {
    // Initialization code
  }

  // Named constructor that forwards to the default one
  Spacecraft.unlaunched(String name) : this(name, null);

  // Method
  void describe() {
    print('Spacecraft: $name');
    print('Launch Year: ${this.launchYear}');
  }
}

void main() {
  var craft = Spacecraft('Voyager', DateTime(2026, 1, 1));
  craft.describe();
}
```

Classes support traditional inheritance alongside a special `mixin` type:

```dart
mixin Piloted {
  int astronauts = 1;

  void describeCrew() {
    print('Astronaut #: $astronauts`);
  }
}

class AmericanSpacecraft extends Spacecraft with Piloted {
  String launchState;

  AmericanSpacecraft(super.name, DateTime super.launchDate, this.altitude);

  // Optional @override annotation
  @override
  void describe() {
    print('Spacecraft: $name');
    print('Launch Year: ${this.launchYear}');
  }
}
```

Finally, *Dart* supports interfaces and abstract classes:

```dart
interface class Vehicle {
  void moveForward(int meters) {
    // ...
  }
}

class Car extends Vehicle {
  @override
  void moveForward(int meters) {
    // ...
  }
}
```

**Note:** A `final class` prevents any class from outside the current library
from inheriting it. This is useful for safeguarding implementation changes in
external libraries.

Additionally, a `sealed class` only allows subclasses to be defined in the same
library, allowing for them to be switched over safely and **exhaustively**.

## Enumerated Values

*Dart* supports `enum` types, similar to other languages:

```dart
enum PlanetType { terrestrial, gas, ice }

void main() {
  final PlanetType myType = PlanetType.terrestrial;
  if (myType == PlanetType.terrestrial) {
    print('Terrestrial!');
  }
}
```

One can also create a more complex `enum` that supports adding specific
properties to each enumerated value, as well as custom getters and setters:

```dart
enum Planet {
  mercury(planetType: PlanetType.terrestrial, moons: 0, hasRings: false),
  venus(planetType: PlanetType.terrestrial, moons: 0, hasRings: false),
  // ···
  uranus(planetType: PlanetType.ice, moons: 27, hasRings: true),
  neptune(planetType: PlanetType.ice, moons: 14, hasRings: true);

  // A constant generating constructor
  const Planet({
    required this.planetType,
    required this.moons,
    required this.hasRings,
  });

  // All instance variables are final
  final PlanetType planetType;
  final int moons;
  final bool hasRings;

  bool get isGiant =>
      planetType == PlanetType.gas || planetType == PlanetType.ice;
}
```

## Asynchronous

*Dart* supports `async` and `await` for avoiding callback hell:

```dart
const oneSecond = Duration(seconds: 1);
// ···
Future<void> printWithDelay(String message) async {
  await Future.delayed(oneSecond);
  print(message);
}
```

This is equivalent to the following code:

```dart
Future<void> printWithDelay(String message) {
  return Future.delayed(oneSecond).then((_) {
    print(message);
  });
}
```

## Exceptions

An exception can be thrown with the `throw` keyword:

```dart
if (astronauts == 0) {
  throw StateError('No astronauts.');
}
```

Exceptions are handled with the `catch` keyword (clean-up operations are
guaranteed to run in the `finally` block):

```dart
try {
  ship.doSomething();
} on IOException catch (e) {
  print('Could not describe object: $e');
} finally {
  ship.close();
}
```

## Null Safety

*Dart* supports shorthand syntax for dealing with nullable types:

```dart
List<String>? nullable;

// ...

// Covers both empty and null list cases
if (nullable?.isEmpty ?? false) {
  return 'Empty';
}
```

## Standard Library

### `dart:core`

```dart
assert(int.parse('42') == 42);
assert(int.parse('0x42') == 66);
assert(double.parse('0.50') == 0.5);

assert(num.parse('42') is int);
assert(num.parse('0x42') is int);
assert(num.parse('0.50') is double);

// Convert an int to a string.
assert(42.toString() == '42');

// Convert a double to a string.
assert(123.456.toString() == '123.456');

// Specify the number of digits after the decimal.
assert(123.456.toStringAsFixed(2) == '123.46');

// Specify the number of significant figures.
assert(123.456.toStringAsPrecision(2) == '1.2e+2');
assert(double.parse('1.2e+2') == 120.0);

// Check whether a string contains another string.
assert('Never odd or even'.contains('odd'));

// Does a string start with another string?
assert('Never odd or even'.startsWith('Never'));

// Does a string end with another string?
assert('Never odd or even'.endsWith('even'));

// Find the location of a string inside a string.
assert('Never odd or even'.indexOf('odd') == 6);

// Grab a substring.
assert('Never odd or even'.substring(6, 9) == 'odd');

// Split a string using a string pattern.
var parts = 'progressive web apps'.split(' ');
assert(parts.length == 3);
assert(parts[0] == 'progressive');

// Get a UTF-16 code unit (as a string) by index.
assert('Never odd or even'[0] == 'N');

// Use split() with an empty string parameter to get
// a list of all characters (as Strings); good for
// iterating.
for (final char in 'hello'.split('')) {
  print(char);
}

// Get all the UTF-16 code units in the string.
var codeUnitList = 'Never odd or even'.codeUnits.toList();
assert(codeUnitList[0] == 78);

// Convert to uppercase.
assert('web apps'.toUpperCase() == 'WEB APPS');

// Convert to lowercase.
assert('WEB APPS'.toLowerCase() == 'web apps');

// Trim a string.
assert('  hello  '.trim() == 'hello');

// Check whether a string is empty.
assert(''.isEmpty);

// Strings with only white space are not empty.
assert('  '.isNotEmpty);

var greetingTemplate = 'Hello, NAME!';
var greeting = greetingTemplate.replaceAll(RegExp('NAME'), 'Bob');

// greetingTemplate didn't change.
assert(greeting != greetingTemplate);

var sb = StringBuffer();
sb
  ..write('Use a StringBuffer for ')
  ..writeAll(['efficient', 'string', 'creation'], ' ')
  ..write('.');

var fullString = sb.toString();

assert(fullString == 'Use a StringBuffer for efficient string creation.');

// Here's a regular expression for one or more digits.
var digitSequence = RegExp(r'\d+');

var lettersOnly = 'llamas live fifteen to twenty years';
var someDigits = 'llamas live 15 to 20 years';

// contains() can use a regular expression.
assert(!lettersOnly.contains(digitSequence));
assert(someDigits.contains(digitSequence));

// Replace every match with another string.
var exedOut = someDigits.replaceAll(digitSequence, 'XX');
assert(exedOut == 'llamas live XX to XX years');

var digitSequence = RegExp(r'\d+');
var someDigits = 'llamas live 15 to 20 years';

// Check whether the reg exp has a match in a string.
assert(digitSequence.hasMatch(someDigits));

// Loop through all matches.
for (final match in digitSequence.allMatches(someDigits)) {
  print(match.group(0)); // 15, then 20
}
```

The core library provides support for URL handling:

```dart
var uri = 'https://example.org/api?foo=some message';

var encoded = Uri.encodeFull(uri);
assert(encoded == 'https://example.org/api?foo=some%20message');

var decoded = Uri.decodeFull(encoded);
assert(uri == decoded);

var builtUri = Uri(
  scheme: 'https',
  host: 'example.org',
  path: '/foo/bar',
  fragment: 'frag',
  queryParameters: {'lang': 'dart'},
);
assert(builtUri.toString() == 'https://example.org/foo/bar?lang=dart#frag');
```

Support for date and time handling is also provided:

```dart
// Get the current date and time.
var now = DateTime.now();

// Create a new DateTime with the local time zone.
var y2k = DateTime(2000); // January 1, 2000

// Specify the month and day.
y2k = DateTime(2000, 1, 2); // January 2, 2000

// Specify the date as a UTC time.
y2k = DateTime.utc(2000); // 1/1/2000, UTC

// Specify a date and time in ms since the Unix epoch.
y2k = DateTime.fromMillisecondsSinceEpoch(946684800000, isUtc: true);

// Parse an ISO 8601 date in the UTC time zone.
y2k = DateTime.parse('2000-01-01T00:00:00Z');

// Create a new DateTime from an existing one, adjusting just some properties:
var sameTimeLastYear = now.copyWith(year: now.year - 1);

// 1/1/2000, UTC
assert(y2k.millisecondsSinceEpoch == 946684800000);

// 1/1/1970, UTC
var unixEpoch = DateTime.utc(1970);
assert(unixEpoch.millisecondsSinceEpoch == 0);
```

It is also possible to create custom iterators:

```dart
class Process {
  // Represents a process...
}

class ProcessIterator implements Iterator<Process> {
  @override
  Process get current => ...
  @override
  bool moveNext() => ...
}

// A mythical class that lets you iterate through all
// processes. Extends a subclass of [Iterable].
class Processes extends IterableBase<Process> {
  @override
  final Iterator<Process> iterator = ProcessIterator();
}

void main() {
  // Iterable objects can be used with for-in.
  for (final process in Processes()) {
    // Do something with the process.
  }
}
```

### `dart:convert`

JSON-encoded strings can be decoded and encoded:

```dart
// NOTE: Be sure to use double quotes ("),
// not single quotes ('), inside the JSON string.
// This string is JSON, not Dart.
var jsonString = '''
  [
    {"score": 40},
    {"score": 80}
  ]
''';

var decodedScores = jsonDecode(jsonString);
assert(decodedScores is List);

var firstScore = decodedScores[0];
assert(firstScore is Map);
assert(firstScore['score'] == 40);

var scores = [
  {'score': 40},
  {'score': 80},
  {'score': 100, 'overtime': true, 'special_guest': null},
];

var jsonText = jsonEncode(scores);
assert(
  jsonText ==
      '[{"score":40},{"score":80},'
          '{"score":100,"overtime":true,'
          '"special_guest":null}]',
);
```

### `dart:io`

IO methods allow for file handling:

```dart
void main() async {
  var config = File('config.txt');

  // Put the whole file in a single string.
  var stringContents = await config.readAsString();
  print('The file is ${stringContents.length} characters long.');

  // Put each line of the file into its own string.
  var lines = await config.readAsLines();
  print('The file is ${lines.length} lines long.');
}
```

It is also possible to read binary files as lists of integer bytes:

```dart
void main() async {
  var config = File('config.txt');

  var contents = await config.readAsBytes();
  print('The file is ${contents.length} bytes long.');
}
```
