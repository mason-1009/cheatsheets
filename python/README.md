# Python

> Every sufficiently advanced LISP application will eventually reimplement
> Python.

---

## Numbers

```python
10 + 3  # 13
10 - 3  # 7
10 * 3  # 30
10 / 3  # 3.3333333333333335
10 // 3 # 3
10 % 3  # 1
2 ** 3  # 8
```

## Strings

```python
"a".upper()               # "A"
"A".lower()               # "a"
" a ".strip()             # "a"
"abc".replace("bc", "ha") # "aha"
"a b".split()             # ["a", "b"]
"-".join(["a", "b"])      # "a-b"
```

## Built-In Functions

```python
callable(obj) # Checks if an object can be called as a function
dir()         # Lists attributes and methods
globals()     # Get a dictionary of the current global symbol table
hash(obj)     # Get the hash value
id(obj)       # Get the unique identifier
locals()      # Get a dictionary of the current local symbol table
repr(obj)     # Get a string representation for debugging
```

## Comprehensions

List comprehensions allow for easy transformations of lists:

```python
squares = [x**2 for x in range(10)]
evens = [x for x in range(20) if x % 2 == 0]
```

There also exists comprehensions for dictionaries, sets, and generators:

```python
length_dict = {word: len(word) for word in ["hello", "world"]}
length_set = {len(word) for word in ["who", "what", "why"]}
sum_squares = sum(x**2 for x in range(1000))
```

## Sets

Sets allow for quick comparisons of collections of values and constant-time
membership checks:

```python
a = {1, 2, 3}
b = set([3, 4, 4, 5])

a | b # {1, 2, 3, 4, 5}
a & b # {3}
a - b # {1, 2}
a ^ b # {1, 2, 4, 5}
```

## Files

```python
# Read an entire file
with open("file.txt", mode="r", encoding="utf-8") as file:
    content = file.read()

# Read a file line-by-line
with open("file.txt", mode="r", encoding="utf-8") as file:
    for line in file:
        print(line.strip())

# Write a file
with open("output.txt", mode="w", encoding="utf-8") as file:
    file.write("Hello, World!\n")

# Append to a file
with open("log.txt", mode="a", encoding="utf-8") as file:
    file.write("New log entry\n")
```

## Mapping

The `map(func, iterable)` applies `func` to `iterable`, generating another
`iterable` that is evaluated as it is consumed:

```python
mapped_iter = map(lambda n: n * 2, range(5))
list(mapped_iter) # [0, 2, 4, 6, 8]
```

## Filtering

The `filter(func, iterable)` function applies `func` to `iterable`, selecting
elements from `iterable` only when the result of `func` is a true value and
returns another `iterable` that is evaluated as items are consumed from it:

```python
filter_iter = filter(lambda n: n % 2 == 0, range(10))
list(filter_iter) # [0, 2, 4, 6, 8]
```

## Handling CSV Files

Python's built-in `csv` library can handle reading and writing both
comma-separated and tab-separated text files. The `csv.DictReader` class can be
used to read from a file descriptor:

```python
import csv

# Read a CSV file as a list of dictionaries
with open('file.csv', 'r') as csv_file:
    dict_reader = csv.DictReader(csv_file)
    for row in dict_reader:
        ...

# Read a TSV file as a list of dictionaries
with open('file.tsv', 'r') as tsv_file:
    dict_reader = csv.DictReader(tsv_file, delimiter='\t')
    for row in dict_reader:
        ...
```

And the `csv.DictWriter` class can be used to write a list of dictionaries to a
file descriptor:

```python
import csv

with open('names.csv', 'w') as csv_file:
    fieldnames = ['first_name', 'last_name']
    writer = csv.DictWriter(csv_file, fieldnames=fieldnames)

    writer.writeheader()
    writer.writerow({'first_name': 'Baked', 'last_name': 'Beans'})
    writer.writerow({'first_name': 'Lovely', 'last_name': 'Spam'})
    writer.writerow({'first_name': 'Wonderful', 'last_name': 'Spam'})

    # Bulk writing
    writer.writerows(some_iterable)

with open('names.tsv', 'w') as tsv_file:
    fieldnames = ['first_name', 'last_name']
    writer = csv.DictWriter(tsv_file, fieldnames=fieldnames, delimiter='\t')

    writer.writeheader()

    writer.writerow({'first_name': 'Baked', 'last_name': 'Beans'})
    writer.writerow({'first_name': 'Lovely', 'last_name': 'Spam'})
    writer.writerow({'first_name': 'Wonderful', 'last_name': 'Spam'})

    # Bulk writing
    writer.writerows(some_iterable)
```

## Parsing Configuration Files

Python has built-in support for reading `.ini` configuration files using the
`configparser` library. Consider the following file `config.ini`:

```ini
[DEFAULT]
ServerAliveInterval = 45
Compression = yes
CompressionLevel = 9
ForwardX11 = yes

[forge.example]
User = hg

[topsecret.server.example]
Port = 50022
ForwardX11 = no
```

Values from this file can be read and parsed:

```python
import configparser

with open('config.ini', 'r') as config_file:
    config = configparser.ConfigParser()
    config.read_file(config_file)

config['DEFAULT']['ForwardX11']     # 'yes'
config.get('forge.example', 'User') # 'hg'
```

The configuration values can be edited and written to a new file:

```python
config.set('DEFAULT', 'key', 'value')

with open('config.new.ini', 'w') as config_file:
    config.write(config_file)
```

Which produces the following `config.new.ini`:

```ini
[DEFAULT]
serveraliveinterval = 45
compression = yes
compressionlevel = 9
forwardx11 = yes
key = value

[forge.example]
user = hg

[topsecret.server.example]
port = 50022
forwardx11 = no
```
