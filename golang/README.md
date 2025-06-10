# Golang

> Go is like a better C, from the guys that didn't bring you C++. - Ikai Lan

---

## Main Method

```go
import "fmt"

func main() {
    fmt.Println("Hello, world!")
}
```

## Variables

```go
// Declarations
var msg string
var x, y int

// Definitions
msg := "Hello, world!"
var msg = "Hello, world!"
var msg string = "Hello, world!"

// Multiple assignments
var x, y int = 1, 2
```

## Structs

### Basic Use

```go
type MyStruct struct {
    X int
    Y int
}

myStruct := MyStruct{
    X: 3,
    Y: 4,
}

fmt.Println(myStruct.X) // 3
fmt.Println(myStruct.Y) // 4

// Pointers to structs
myStructPtr := &MyStruct{X: 3, Y: 4}

// Nothing changes
fmt.Println(myStructPtr.X) // 3
```

### Receivers

```go
type MyStruct struct {
    X int
    Y int
}

func (m MyStruct) Print() {
    fmt.Printf("X=%d, Y=%d\n", m.X, m.Y)
}

myStruct := MyStruct{
    X: 3,
    Y: 4,
}

myStruct.Print() // X=3, Y=4
```

### Mutation

```go
func (m *MyStruct) EditX(newValue int) {
    m.X = newValue
}

myStruct := MyStruct{
    X: 3,
    Y: 4,
}

myStruct.Print() // X=3, Y=4

myStruct.EditX(300)
myStruct.Print() // X=300, Y=4
```

## Interfaces

```go
// Can be used as a type for anything that implements these functions as
// receivers
type Shape Interface {
    Area() float64
    Perimeter() float64
}
```

## Constants

```go
const BigConstant = 1.618
const TypedConstant int64 = 1024

// Multiple constants
const (
    Pi = 3.14
    E = 2.718
)

const (
    Sunday = iota // = 0
    Monday = 1
    Tuesday = 2
    Wednesday = 3
)
```

## Numbers

```go
num := 3 // int
num := 3. // float64
num := 3 + 4i // complex128
num := byte('a') // byte (alias for uint8)
```

## Arrays

```go
stringArray := [...]string{
    "String One",
    "String Two",
    "String Three",
}
```

## Slices

```go
emptySlice := []int{}
nonEmptySlice := []int{1, 2, 3}

// Byte slice from string
byteSlice := []byte("Hello")
```

## Pointers

```go
func GetPointer() *int {
    i := 123
    return &i
}

a := *GetPointer() // a = 123

// Creating a pointer from a type
newPointer := new(int64)
*newPointer = 1234
```

## Type Casting

```go
i := 2
f := float64(i)
u := uint(i)
```

## Conditionals

```go
if i % 2 == 0 {
    fmt.Println("Even")
} else {
    fmt.Println("Odd")
}
```

## Loops

```go
// Standard for-loop
for count := 0; count <= 10; count++ {
    fmt.Println(count)
}

// Ranged loop
entries := []int{5, 4, 3, 2, 1}
for i, val := range entries {
    fmt.Printf(" i (%d) = %d\n", i, val)
}

// While loop (still uses for keyword)
mySlice := []int{}
for len(mySlice) < 3 {
    mySlice = append(mySlice, 0)
}
```

## Switch

```go
switch today {
case "thursday":
    fmt.Printf("Today is %s\n", today)
case "saturday":
    today = "sunday"
default:
    today = "monday"
}
```

## Lambdas

```go
isOdd := func(n int) bool {
    return n % 2 == 1
}

fmt.Println(isOdd(1)) // true
fmt.Println(isOdd(2)) // false
```

## Packages

```go
import m "math/rand"

m.Intn()
```

## Defer

```go
func Deferred() {
    // Runs once a surrounding function returns
    defer fmt.Println("Done")
    fmt.Println("Started")
}
```

## Strings

```go
import (
	"strings"
)

strings.Contains("seafood", "eaf") // => true
strings.Fields("  foo bar baz  ") // => ["foo", "bar", "baz"]
strings.Join([]string{"a", "b", "c"}, ",") // => "a,b,c"
strings.ToUpper("test") // => "TEST"
strings.ToLower("TEST")) // => "test"
strings.TrimSpace("   test   ") // => "test"
```

## Regular Expressions

```go
import (
	"regexp"
)

compiledRegex := regexp.MustCompile(`([a-z]+)=([0-9]+)`)
exampleString := "key=1  otherkey=5 || nextkey=100"

// n = -1 means find all matches (limit matches with positive number)
compiledRegex.FindAllString(exampleString, -1) // => ["key=1", "otherkey=5", "nextkey=100"]

// n = -1 means find all matches (limit matches with positive number)
compiledRegex.FindAllStringSubmatch(exampleString, -1)
// => [["key=1", "key", "1"], ["otherkey=5", "otherkey", "5"], ["nextkey=100", "nextkey", "100"]]
```

## JSON

### Decoding

```go
import (
	"fmt"
	"encoding/json"
)

type ResponseItem struct {
	Name string `json:"name"`
	Age int `json:"age"`
}

body := []byte("{\"name\": \"Johnny Appleseed\", \"age\": 18}")

// Convert JSON to struct
var parsed ResponseItem
json.Unmarshal(body, &parsed)
```

### Encoding

```go
import (
	"fmt"
	"encoding/json"
)

type ResponseItem struct {
	Name string `json:"name"`
	Age int `json:"age"`
}

responseItem := ResponseItem {
    Name: "Firstname Lastname",
    Age: 57,
}

byteString, _ := json.Marshal(responseItem)
text := string(byteString)
```

## HTTP Requests

### GET

```go
import (
	"io"
	"net/http"
)

resp, _ := http.Get("https://www.google.com/humans.txt")

// Read the response into a string
body, _ := io.ReadAll(resp.Body)
stringBody := string(body)
```

### POST

```go
import (
	"io"
	"fmt"
	"bytes"
	"net/http"
	"encoding/json"
)

type ResponseItem struct {
	Title string `json:"title"`
	Body string `json:"body"`
	UserId int `json:"userId"`
}

// Create POST body and convert to bytes
postBody, _ := json.Marshal(map[string]any{
    "title": "My Title",
    "body:": "Example body",
    "userId": 1,
})
buffer := bytes.NewBuffer(postBody)

// Make the request
resp, _ := http.Post(
    "https://jsonplaceholder.typicode.com/posts",
    "application/json",
    buffer,
)
responseText, _ := io.ReadAll(resp.Body)

// Parse the JSON response
var parsed ResponseItem
json.Unmarshal(responseText, &parsed)
```
