# Ruby

## Actually, I didn't make the claim that Ruby follows the principle of least surprise. Someone felt the design of Ruby follows that philosophy, so they started saying that. I didn't bring that up, actually. - Matz, Creator of Ruby

---

### Printing to standard output
```
puts "Hello, world!"
```

### Commenting
```
# Single-line comment
=begin
This comment occupies
multiple lines.
=end
```

### String Handling
```
my_string = "Test String"

# Common string methods
my_string.length  # Length of string
my_string.reverse  # Reversed string
my_string.upcase  # Uppercased string
my_string.downcase  # Downcased string

# String interpolation
result = "This is an interpolated string: #{my_string}"

# User input
input = gets.chomp  # Gets line, removes \n with .chomp

# Convert to integer
num = my_string.to_i
```

### Control flow
```
# if-elsif-else
if num > 5
    puts "Num is greater than 5"
elsif num < 5
    puts "Num is less than 5"
elsif num == 5
    puts "Num is equal to 5"
else
    puts "Something else"
end

# Boolean operators
true || false  # result: true
true && false  # result: false

# unless operator
unless num > 5
    puts "Num is less than 5"
end
```

### Arrays
```
my_array = [1, 2, 3]

# Indexing
my_array[0]  # result: 1

# Iterate over arrays
my_array.each { |item| puts item }

# Sorting
my_array.sort  # Return sorted array
my_array.sort!  # Modify the array to be sorted
```

### Hashes
```
# Hashes with symbols
my_hash = {
    :first_name => 'Johnny',
    :last_name => 'Appleseed',
    :age => 32
}

# Also uses symbols
my_hash = {
    first_name: 'Johnny',
    last_name: 'Appleseed',
    age: 32
}

puts my_hash[:age]  # result: 32

# Iterate over key-value pairs
my_hash.each { |key, value| puts "#{key}: #{value}" }

# Iterate over keys
my_hash.each_key { |key| puts key }

# Iterate over values
my_hash.each_value { |value| puts value }
```

### Iteration
```
# Iterate over structures
data = [1, 3, 5, 6]

# Iterate without index
data.each do |num|
    puts num
end

# Iterate with index
data.each_with_index do |element, index|
    puts "Index #{index} = #{element}"
end

# Mapping
data.map do |num|
    num * 2
end
# or
data.map { |num| num * 2 |

# Loop over numbers
for i in 1..10
    puts i
end

# Loop over conditions
while num < 5 do
    num = num + 1
    puts num
end
```

### Functional features
```
# Apply a block to every array element
array_one = [1, 3, 5]
array_two = array_one.collect { |num| num * 2 }
puts array_two  # result: [2, 6, 10]

# Yield
def test
    puts "Before the yield"
    yield
    puts "After the yield"
end

test { puts "Hello!" }

=begin
Before the yield
Hello!
After the yield
=end
```

### OOP
```
class Test
    @@class_var = 0

    def initialize(name)
        @name = name
        @@class_var += 1
    end

    # Static method
    def self.num_of_items
        return @@class_var
    end
end

a = Test.new("Thing One")
Test.num_of_items  # result: 1

b = Test.new("Thing Two")
Test.num_of_items  # result: 2

# Don't write getters/setters like a Java monkey
class Student
    # Add a getter and a setter for @name
    attr_reader :name
    attr_writer :name
    # Shortcut: attr_accessor :name adds reader+writer

    def initialize(name)
        @name = name
    end
end
```

### Namespace
```
# Defines a module
module MyModule
    def self.test
        puts "Hello!"
    end
end

MyModule::test  # result: Hello!

# Modules can be nested
# Import a module from a file
require 'date'
```
