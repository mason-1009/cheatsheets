# Rust

> A quote from Chris Dickinson, engineer at npm, sums it up perfectly for me, because I have thought the same, without knowing the quote at that time: ‘My biggest compliment to Rust is that it's boring, and this is an amazing compliment'.

---

### Primitives
```
let logical: bool = true;

let 32_float: f32 = 1.003;
let 64_unsigned: u64 = 43423;
```

### Tuples
```
let pair: (bool, i32) = (false, 343);

// pair.0 = false
// pair.1 = 343
```

### Arrays
```
// Fixed array of unsigned 32-bit integers
let fixed: [u32, 5] = [1, 2, 3, 4, 5];
let same_value: [u32, 5] = [0, 5];

// fixed.len() = 5
```

### Structures and Enums
```
struct Point {
    x: f32,
    y: f32,
}

let my_point: Point = Point { x: 0.242, y: 4.234 };

// my_point.x = 0.242
// my_point.y = 4.234

// Tuple-like struct
struct Pair(f32, f32);
let my_pair: Pair = Pair(0.333, 0.666);

// my_pair.0 = 0.333
// my_pair.1 = 0.666

enum WebEvent {
    KeyPress(char),
    Click { x: i64, y: i64 },
}

fn enum_func(event: WebEvent) {
    match event {
        WebEvent::KeyPress(c) => println!("Pressed {}", c),
        WebEvent::Click { x, y } => println!("x={}, y={}", x, y),
    }
}

let press_event = WebEvent::KeyPress('x');
let click_event = WebEvent::Click { x: 20.333, y: 12.322 };

enum_func(press_event) // Pressed x
enum_func(click_event) // x=20.333, y=12.322

// C-style enums
enum Number {
    Zero,
    One,
    Two,
}

// Number::Zero as u32 = 0
// Number::One as u32 = 1
```

### Iterators
```
// v1_iter needs to be mutable for .next() to work
// .iter() iterates over immutable references
// .into_iter() iterates over owned values
let v1 = vec![1, 2];
let mut v1_iter = v1.iter();

v1_iter.next() // 1
v1_iter.next() // 2
v1_iter.next() // None

let v2 = v1.iter().map(|x| x + 1).collect(); // [2, 3]
```
