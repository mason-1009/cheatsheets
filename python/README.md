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

## Dates and Times

Specific points in time can be represented with the `datetime.datetime`
object:

```python
import datetime

# Timezone-naive objects
datetime.datetime.now()
datetime.datetime.fromtimestamp(1765327531)
datetime.datetime(year=2025, month=6, day=19)
datetime.datetime.fromisoformat('2011-11-04T00:05:23')

# Timezone-aware objects
datetime.datetime.now(tz=datetime.UTC)
datetime.datetime.fromtimestamp(1765327531, tz=datetime.UTC)
datetime.datetime(year=2025, month=6, day=19, tzinfo=datetime.UTC)
datetime.datetime.fromisoformat('2011-11-04T00:05:23Z')
datetime.datetime.fromisoformat('2011-11-04 00:05:23.283+00:00')

# Convert to ISO format
dt = datetime.datetime(year=2025, month=6, day=19, tzinfo=datetime.UTC)
dt.isoformat() # 2025-06-19T00:00:00+00:00''

# Perform math on datetime objects
datetime.datetime.now() + datetime.timedelta(days=4, hours=3)
```

### Timezone Conversions

```python
import datetime
from zoneinfo import ZoneInfo

dt = datetime.datetime.fromisoformat('2011-11-04T00:05:23Z')

# Returns another timezone-aware object in Los Angeles time
la_time = dt.astimezone(tz=ZoneInfo('America/Los_Angeles'))

# Similarly for New York time
ny_time = dt.astimezone(tz=ZoneInfo('America/New_York'))
```

List available timezones:

```python
from zoneinfo import available_timezones

available_timezones()
```

### Handling Dates

```python
import datetime

# Create a date object
datetime.date(year=2012, month=12, day=21)

# Get the current date
datetime.date.today()
datetime.datetime.now().date()

# Get the weekday
today = datetime.date.today()

# Monday = 0 --> Sunday = 6
today.weekday()

# Monday = 1 --> Sunday = 7
today.isoweekday()

# Perform math on dates
nd = datetime.date(year=2011, month=5, day=1) + datetime.timedelta(days=5)
nd.isoformat() # '2011-05-06'
```

### Calendar

The built-in `calendar` module provides utilities for handling calendar-related
tasks, as well as constants for numbered days:

```python
import calendar

calendar.MONDAY # int(calendar.MONDAY) returns `0`
calendar.TUESDAY
calendar.WEDNESDAY
calendar.THURSDAY
calendar.FRIDAY
calendar.SATURDAY
calendar.SUNDAY # int(calendar.SUNDAY) returns `6`
```

Numbered (from 1 to 12) enumerated constants for months are also available:

```python
import calendar

calendar.JANUARY
calendar.FEBRUARY
calendar.MARCH
calendar.APRIL
calendar.MAY
calendar.JUNE
calendar.JULY
calendar.AUGUST
calendar.SEPTEMBER
calendar.OCTOBER
calendar.NOVEMBER
calendar.DECEMBER
```

Finally, the `calendar` module provides methods for quickly and easily
iterating through calendar dates:

```python
import calendar


cal = calendar.Calendar()

# Get `datetime.date` objects for every day in January 2025
cal.itermonthdates(2025, calendar.JANUARY)
```

The `list(...)` evaluates the generator to the following list:

```python
[
    datetime.date(2024, 12, 30),
    datetime.date(2024, 12, 31),
    datetime.date(2025, 1, 1),
    datetime.date(2025, 1, 2),
    datetime.date(2025, 1, 3),
    datetime.date(2025, 1, 4),
    datetime.date(2025, 1, 5),
    datetime.date(2025, 1, 6),
    datetime.date(2025, 1, 7),
    datetime.date(2025, 1, 8),
    datetime.date(2025, 1, 9),
    datetime.date(2025, 1, 10),
    datetime.date(2025, 1, 11),
    datetime.date(2025, 1, 12),
    datetime.date(2025, 1, 13),
    datetime.date(2025, 1, 14),
    datetime.date(2025, 1, 15),
    datetime.date(2025, 1, 16),
    datetime.date(2025, 1, 17),
    datetime.date(2025, 1, 18),
    datetime.date(2025, 1, 19),
    datetime.date(2025, 1, 20),
    datetime.date(2025, 1, 21),
    datetime.date(2025, 1, 22),
    datetime.date(2025, 1, 23),
    datetime.date(2025, 1, 24),
    datetime.date(2025, 1, 25),
    datetime.date(2025, 1, 26),
    datetime.date(2025, 1, 27),
    datetime.date(2025, 1, 28),
    datetime.date(2025, 1, 29),
    datetime.date(2025, 1, 30),
    datetime.date(2025, 1, 31),
    datetime.date(2025, 2, 1),
    datetime.date(2025, 2, 2),
]
```

**Note:** This method returns all days before the start of the month and after
the end of the month in order to form a complete week on both ends.

## Context Managers

Context managers allow for the concise, convenient allocation, use, and
automatic deallocation of resources using the `with` keyword. A context manager
can be created quickly with the `contextlib` module, or constructed as a class.

### Class-Based Context Manager

All synchronous class-based context managers fit the form of
`contextlib.AbstractContextManager`, defining `__enter__` and `__exit__`. The
return value of `__enter__` is bound to the variable defined in the `with`
statement, while `__exit__` cleans up when the interior code is finished:

```python
from types import TracebackType
from contextlib import AbstractContextManager


class ContextManager(AbstractContextManager):
    def __enter__(self) -> str:
        print('Entering the context manager')
        return 'Hello!'

    def __exit__(
        self, exc_type: type[BaseException] | None,
        exc_value: BaseException | None, traceback: TracebackType | None
    ) -> None:
        # Do cleanup here
        print('Exiting the context manager')


with ContextManager() as provided_var:
    print(provided_var)
```

This creates the following output:

```text
Entering the context manager
Hello!
Exiting the context manager
```

**Note:** In cases where an exception is thrown by the code within the context
manager, `exc_type`, `exc_value`, and `traceback` will be passed to `__exit__`.
Otherwise, these values are `None`.

### Yield-Based Context Manager

The `contextlib` library also provides the `contextmanager` decorator, which
allows for very simple context managers to be created as generator functions
with the `yield` keyword:

```python
from contextlib import contextmanager


@contextmanager
def context_manager(number: int):
    print('Entering context manager')
    yield f'The number is {number}'
    print('Exiting context manager')


with context_manager(number=10) as provided_var:
    print(provided_var)
```

Which creates the following output:

```text
Entering context manager
The number is 10
Exiting context manager
```

## Command-Line Arguments

Python has built-in support for handling command-line utilities using its
`argparse` module:

```python
import argparse

argument_parser = argparse.ArgumentParser(
    prog='program-name',
    description='Does thing A and thing B!',
    epilog='Bottom help text'
)

# Add a required positional argument
argument_parser.add_argument(
    'filepath', help='The path of the file'
)

# Pass a value using a switch (required)
argument_parser.add_argument(
    '-o', '--output',
    dest='output_path', required=True,
    help='The path of the output file'
)

# Pass a value using a switch (optional)
argument_parser.add_argument(
    '-s', '--separator',
    dest='sep_char', required=False,
    help='An optional separator character'
)

# Add an on/off flag
argument_parser.add_argument(
    '-v', '--verbose',
    required=False, action='store_true',
    dest='verbose', default=False,
    help='Enable verbose logging'
)

# Pass arguments as a list (useful for testing)
namespace = argument_parser.parse_args([
    '-o', 'other_file', 'filename'
])

# Otherwise, the parser pulls args from sys.argv
namespace = argument_parser.parse_args()

# Access namespace values directly
print(f'File path is {namespace.filepath}')
```

**Note:** The object returned by `parse_args(...)` is an `argparse.Namespace`
object, with parsed argument values set as instance attributes. The key is
determined by the name of the flag, or by the value of its `dest` argument.

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

## Handling Emails

Python has built-in support for creating and parsing emails via its `email`
module:

### Creating and Sending an Email

Using `smtplib` (built-in) and `email`, one can construct a valid email message
and send it directly to an SMTP server:

```python
import smtplib
from email.message import EmailMessage

# Read from a file for message content
with open('path/to/file.txt', 'r') as fp:
    msg = EmailMessage()
    msg.set_content(fp.read())

msg['Subject'] = 'Subject Line --- IMPORTANT'
msg['From'] = 'my.address@email.com'
msg['To'] = 'your.address@email.com'

# Send the message to a locally-running SMTP server
s = smtplib.SMTP('localhost')
s.send_message(msg)
s.quit()
```

### Parsing Raw Emails

The `email` module can create a `email.message.Message` object from a file
pointer (using `Parser().parse(...)`) or a string (using
`Parser().parsestr(...)`):

```python
import base64
from email.parser import Parser

with open('path/to/email_file.eml', 'r') as email_fp:
    # Use `Parser().parsestr(...)` for non-file pointers
    # `parsed_email` is an `email.message.Message` object
    parsed_email = Parser().parse(email_fp)

# Access email headers like a dictionary (case-insensitive)
parsed_email['To']   # 'example@email.com'
parsed_email['From'] # 'NYT Cooking <nytdirect@nytimes.com>'
parsed_email['Date'] # 'Fri, 16 Jan 2026 16:01:47 +0000'

# Get all headers
parsed_email.keys()

# Content type
parsed_email.is_multipart()     # True
parsed_email.get_content_type() # 'text/html`

# Emails are often multipart, especially if they contain attachments. Walk
# through an email's parts to get the portion you want.
for part in parsed_email.walk():
    if not part.is_multipart():
        # This means the message has no children
        if part.get_content_maintype() == 'text':
            if part.get_content_type() == 'text/plain':
                # Print decoded UTF-8 text
                print(part.get_payload(decode=True))
            elif part.get_content_type() == 'text/html':
                # Print decoded UTF-8 text
                print(part.get_payload(decode=True))
            else:
                ...
        elif part.get_content_maintype() == 'image':
            # Parse `base64`-encoding string if the return value is a
            # string/byte-string
            if part.get_content_type() == 'image/jpeg':
                with open(part.get_filename(), 'wb') as output_fp:
                    output_fp.write(base64.b64decode(part.get_payload()))
        else:
            ...
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
