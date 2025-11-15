# Javascript

> JavaScript is the only language that I'm aware of that people feel they don't
> need to learn before they start using it. - Douglas Crockford

---

## Output

```js
console.log("Hello, world!");
```

## Strings

```js
const stringValue = "  UPPER lower 1234  ";

stringValue.length; // 20

// Slicing
stringValue.charAt(0); // " "
stringValue.charAt(10); // "w"

stringValue.substring(4); // "PER lower 1234  "
stringValue.substring(2, 4); // "UP"
stringValue.slice(2, 4); // "UP"

stringValue.split(" "); // [ "", "", "UPPER", "lower", "1234", "", "" ]

// Building
stringValue.repeat(2); // "  UPPER lower 1234    UPPER lower 1234  "
stringValue.concat(" -- END"); // "  UPPER lower 1234   -- END"

// Transforming
stringValue.toUpperCase(); // "  UPPER LOWER 1234  "
stringValue.toLowerCase(); // "  upper lower 1234  "

stringValue.trim(); // "UPPER lower 1234"
stringValue.trimEnd(); // "  UPPER lower 1234"
stringValue.trimStart(); // "UPPER lower 1234  "

stringValue.replace("1234", "4321"); // "  UPPER lower 4321  "

// Padding
"5".padEnd(4, "0"); // "5000"
"5".padStart(4, "0"); // "0005"
```

## Assignment

```js
// Global scope
var globalVar = "global";

// Block scope
let localVar = "local";

// Block scope and immutable
const immutableLocalVar = "immutable";
```

## Control Flow

```js
// Conditionals with if-else
if (n > 0) {
  console.log("Positive");
} else if (n === 0) {
  console.log("Zero");
} else {
  console.log("Negative");
}

// Conditionals with switch statements
switch (count) {
  case 0:
    console.log("Zero");
    break;
  case 1:
    console.log("One");
    break;
  case 2:
    console.log("A couple");
    break;
  default:
    console.log("Another number");
}
```

## Arrays

Arrays are zero-indexed and accessible via bracket syntax:

```js
const fruits = ["apple", "pear", "peach"];

fruits.length; // 3

fruits[1]; // "pear"
fruits[5]; // undefined

Object.keys(fruits); // ["0", "1", "2"]
```

Arrays have multiple built-in methods:

```js
const numbers = [1, 2, 3];

numbers.reverse(); // numbers = [3, 2, 1]
numbers.reverse(); // numbers = [1, 2, 3]

// Reverse without editing numbers
numbers.toReversed(); // [3, 2, 1]

numbers.map((n) => n * 2); // [2, 4, 6]
numbers.filter((n) => n % 2 === 0); // [2]

numbers.concat([4, 5]); // [1, 2, 3, 4, 5]

// Finding the index of the first value
numbers.indexOf(2); // 1
numbers.indexOf(1); // 0
numbers.indexOf(0); // -1 (not found)

// Every number is even
numbers.some((n) => n % 2 === 0); // true
numbers.every((n) => n % 2 === 0); // false

numbers.sort(); // Sorted in place
[5, 6, 2, 1].toSorted(); // [1, 2, 5, 6]

// Sort with custom comparator
[5, 6, 2, 1].toSorted((a, b) => a - b); // [1, 2, 5, 6]

[5, 6, 2, 1].reduce((acc, n) => acc + n, 0); // 14
[5, 6, 2, 1].reduce((acc, n) => acc + n, 10); // 24

// Full reduce callback
// acc = accumulator
// n = current value
// i = index of current value
// arr = the full array
someArray.reduce((acc, n, i, arr) => { ... });
```

There are also methods for handling nested arrays:

```js
const nested = [1, [2, [3, [4, 5]]]];

nested.flat(); // [1, 2, [3, [4, 5]]]
nested.flat(2); // [1, 2, 3, [4, 5]]
nested.flat(3); // [1, 2, 3, 4, 5]
nested.flat(Infinity); // [1, 2, 3, 4, 5]

// Map over a flattened array
nested.flatMap((n) => n); // [1, 2, [3, [4, 5]]]
```

## Objects

Objects can function similarly to classes in object-oriented languages:

```js
const obj = {
  prop: "value",
  123: "one two three",
  instanceMethod: function() {
    return this.prop.toUpperCase();
  },
};

// Accessing and setting
obj.prop = "new value";
obj["prop"]; // "new value";

// Calling methods
obj.instanceMethod(); // "NEW VALUE"
```

Objects also function like hashes, maps, or dictionaries in other languages:

```js
const obj = {
  a: "value for a",
  b: "value for b",
  c: "value for c",
}

// Returns the following value
// [
//   [ "a", "value for a" ],
//   [ "b", "value for b" ],
//   [ "c", "value for c" ]
// ]
Object.entries(obj);

Object.keys(obj); // ["a", "b", "c"]
Object.values(obj); // ["value for a", "value for b", "value for c"]
```

## Error Handling

```js
// Prints "Error: Some error"
try {
  throw new Error("Some error");
} catch (e) {
  console.log(e);
}
```

## Generators

```js
function* numberGenerator(start = 0, end = 5, step = 1) {
  for (let i = start; i <= end; i += step) {
    yield i;
  }
}

Array.from(numberGenerator()); // [0, 1, 2, 3, 4, 5]
```

## Date and Time

```js
const date = new Date();

// Epoch time (seconds)
date.getTime(); // 1763229170853

// Time fields
date.getSeconds(); // 50
date.getMinutes(); // 52
date.getHours(); // 12

// Date fields
date.getDay(); // 6
date.getMonth(); // 10
date.getFullYear(); // 2025

new Date("2023-10-10");
new Date("2017-06-23T12:00:00Z");
```

## Regular Expressions

Native support exists for matching text against regular expressions:

```js
const re = /^Number: \d+$/

re.test("Number: 10"); // true
re.test("Number: 10z"); // false
```

Matching groups are supported:

```js
const groupedRe = /^Number: (\d+)$/

// Returns
// [
//   "Number: 15",
//   "15",
//   index: 0,
//   input: "Number: 15",
//   groups: undefined
// ]
groupedRe.exec("Number: 15");
```

Named groups are also supported:

```js
const namedGroupRe = /^Number: (?<num>\d+)$/

matched = namedGroupRe.exec("Number: 15");
matched.groups.num; // "15"
```

## Promises

Promises are used to handle outcomes from asynchronous operations:

```js
// Create a promise
const myPromise = new Promise((resolve, reject) => {
  if (someCondition) {
    resolve("resolved value");
  } else {
    reject("rejected value");
  }
});

// When someCondition is true, this prints "Resolved: resolved value"
// When someCondition is false, this prints "Rejected: rejected value"
myPromise.then(
  (v) => console.log(`Resolved: ${v}`),
  (v) => console.log(`Rejected: ${v}`)
);
```

Promises are returned by default for `async` functions:

```js
async function returnString() {
  return "string value";
}

// Prints "string value" unless returnString raises an error
returnString().then(
  (v) => console.log(v),
  (v) => console.error(v)
);
```

## JSON

JSON can be generated from objects:

```js
const obj = { key: [1, 2, 3] }

// Returns: {"a":"value for a","b":"value for b","c":"value for c"}
JSON.stringify(obj);
```

JSON can be parsed from strings:

```js
JSON.parse(stringified);
```

## Timers

```js
// Wait three seconds before executing the passed function
const timeout = setTimeout(() => console.log("Ping"), 3000);

// Stop a timeout
clearTimeout(timeout);

// Run the passed function every three seconds
const interval = setInterval(() => console.log("Ping"), 3000);

// Stop the interval
clearInterval(interval);
```
