# `awk`

> If you have a problem and you think `awk(1)` is the solution, then you have
> two problems. - [David Tillbrook](https://regex.info/blog/2006-09-15/247)

---

## Concept

At its core, `awk` is a "data-driven" programming language; an `awk` program is
a series of actions following conditions. When a condition is matched during
execution, that action is performed:

```text
first_condition { first_action }
second_condition { second_action }
...
```

In the simplified example above, `first_action` runs when the program
encounters `first_condition` (a line or some piece of text). Additionally,
`second_action` runs when the program encounters `second_condition`.

## Beginning and Ending

In an `awk` program, the `BEGIN` condition executes before everything else,
regardless of input:

```awk
BEGIN { print "Hello, world"; exit }
```

Running this file with `awk -f script.awk` prints `Hello, world!` to the
console as expected. The `END` condition is also available, allowing arbitrary
commands to be executed at the end of a script, regardless of input. The
following script prints the two lines `Hello` and `World!`, then exits:

```awk
BEGIN {
    print "Hello"
    exit
}
END {
    print "World!"
    exit
}
```

## Regular Expressions

By default, `awk` matches each condition to an input line. Regular expressions
are natively supported as conditions. Consider the example input file
(`test.txt`):

```text
no_space other text
  indented some text
  * asterisk some text
1234 number
1234 number text after
```

Now consider the following `awk` program (`test.awk`) that matches with regular
expressions:

```awk
/text/ {
    print "Line: |" $0 "| contains the word \"text\"!"
}
/^[a-zA-Z]+/ {
    print "Line: |"  $0 "| begins with a word and no spaces"
}
/[0-9]+/ {
    print "Line: |" $0 "| contains a number"
}
/^.*text$/ {
    print "Line: |" $0 "| ends with \"text\"!"
}
```

Produces the following output (`awk -f test.awk test.txt`):

```text
Line: |no_space other text| contains the word "text"!
Line: |no_space other text| begins with a word and no spaces
Line: |no_space other text| ends with "text"!
Line: |  indented some text| contains the word "text"!
Line: |  indented some text| ends with "text"!
Line: |  * asterisk some text| contains the word "text"!
Line: |  * asterisk some text| ends with "text"!
Line: |1234 number| contains a number
Line: |1234 number text after| contains the word "text"!
Line: |1234 number text after| contains a number
```

**Note:** The `$0` variable contains the entire record. By default, a "record"
represents a single line.

## Fields

For each record, `awk` divides it into fields. A field is determined by the
field separator variable, which is set to the space character by default.

Consider the text below:

```text
one|two|three
one,two,three
one+two+three
one two three
```

Now, consider the following `awk` program:

```awk
{
    print $0 " --> " "1=" $1 ", 2=" $2  ", 3=" $3
}
```

The `awk` script above produces the following output:

```text
one|two|three --> 1=one|two|three, 2=, 3=
one,two,three --> 1=one,two,three, 2=, 3=
one+two+three --> 1=one+two+three, 2=, 3=
one two three --> 1=one, 2=two, 3=three
```

**Note:** In `awk`, curly braces without conditions are run for every record.

Suppose the field separator is changed by updating the `FS` variable at the
beginning of the script:

```awk
BEGIN {
    FS="|"
}
{
    print $0 " --> " "1=" $1 ", 2=" $2  ", 3=" $3
}
```

Running the script above produces:

```text
one|two|three --> 1=one, 2=two, 3=three
one,two,three --> 1=one,two,three, 2=, 3=
one+two+three --> 1=one+two+three, 2=, 3=
one two three --> 1=one two three, 2=, 3=
```

It is also possible to use regular expressions as field separators:

```awk
BEGIN {
    FS="[ |,]"
}
{
    print $0 " --> " "1=" $1 ", 2=" $2  ", 3=" $3
}
```

Running it on the file above produces:

```text
one|two|three --> 1=one, 2=two, 3=three
one,two,three --> 1=one, 2=two, 3=three
one+two+three --> 1=one+two+three, 2=, 3=
one two three --> 1=one, 2=two, 3=three
```

## Other Variables

The `NR` (number of records) variable holds the number of records processed *so
far*:

```awk
{ print NR ": " $0 }
```

On the file from above, this produces:

```text
1: one|two|three
2: one,two,three
3: one+two+three
4: one two three
```

**Note:** This counter increments regardless of whether a record was matched by
the given pattern.

Other variables are as follows:

- `FNR`: Similar to `NR`, but resets to 0 for each processed file
- `NF`: The number of fields in the current record
- `FILENAME`: The name of the current input file
- `RS`: The record separator; defaults to a new line
- `OFS`: How `awk` should separate fields it prints (defaults to space)
- `ORS`: How `awk` should separate records it outputs (defaults to new line)

## Operations

In `awk`, arithmetic operations are supported. Consider the following file
containing a profound quote by *Ludwig Wittgenstein*:

```text
The limits of my language
means the limits of my world
```

The following `awk` program will count the number of words (separated by
spaces) and the number of lines:

```awk
{ WORD_COUNT += NF }
END { print "Words: " WORD_COUNT; print "Lines: " NR }
```

Running this script produces the following output:

```text
Words: 11
Lines: 2
```

## Variable Conditions

Variables can be used to create complex conditions:

```awk
NR % 2 == 0 { print $0 }
```

This program prints every even record (line, by default):

```text
means the limits of my world
```

## Arrays

In `awk`, indexed arrays can be used as expected:

```awk
{
    for (i=1; i<=NF; i++)
        # i-1 because $0 contains the entire line
        # ++arrayindex returns the pre-incremented value (like in C)
        words[++arrayindex] = tolower($i)
}
END { for (i in words) print i, "=", words[i] }
```

This creates an ordered array of all of the fields (space-separated words):

```text
1 = the
2 = limits
3 = of
4 = my
5 = language
6 = means
7 = the
8 = limits
9 = of
10 = my
11 = world
```

## Loops and Associative Arrays

Loops and associative arrays are built into `awk` and have a C-like syntax:

```awk
{
    # No { braces } needed for single statement loops
    for (i=1; i<=NF; i++)
        frequency[tolower($i)] += 1
}
END {
    for (i in frequency)
        print "The word", i, "occurs", frequency[i], "time(s)"
}
```

When executed, this produces the following output:

```text
The word limits occurs 2 time(s)
The word of occurs 2 time(s)
The word the occurs 2 time(s)
The word language occurs 1 time(s)
The word world occurs 1 time(s)
The word my occurs 2 time(s)
The word means occurs 1 time(s)
```

## Sorting

Arrays of strings can be sorted (in place) with the built-in `asort` function:

```awk
BEGIN {
    words[0] = "zebra"
    words[1] = "aardvark"
    words[2] = "whale"

    # Sort alphabetically
    asort(words)

    for (i in words)
        print i, words[i]

    exit
}
```

This prints:

```text
1 aardvark
2 whale
3 zebra
```

## Built-In String Functions

### `match`

The `match(...)` function can be used to select fields based on regular
expression matches. Consider the following example log file:

```text
Log Line: dollar_amount=43.44
Log Line: Other log message
Log Line: dollar_amount=43.44 days=44
```

The following `awk` program extracts the number values and adds them to a
numbered array:

```awk
{
    for (i=1; i<=NF; i++)
        # match(...) returns first character index on match, 0 otherwise
        if (match($i, /[a-zA-Z_]+=[0-9\.]+/) != 0)
            matches[++matchindex] = $i
}
END {
    for (i in matches)
        print i, matches[i]
}
```

Running the program against the file produces the following output:

```text
1 dollar_amount=43.44
2 dollar_amount=43.44
3 days=44
```

### `split`

The `split(...)` command breaks a string into an array based on a field
separator:

```awk
{
    for (i=1; i<=NF; i++) {
        if (match($i, /[a-zA-Z_]+=[0-9\.]+/) != 0) {
            split($i, splitwords, "=")

            # First item is at i=1, second is at i=2, and so on
            print splitwords[1], "has a value of", splitwords[2]
        }
    }
}
```

Produces the following output:

```text
dollar_amount has a value of 43.44
dollar_amount has a value of 43.44
days has a value of 44
```

### `sub` and `gsub`

The `sub` (substitute) and `gsub` (global substitute, or all occurrences)
substitute words using regular expressions:

```awk
BEGIN {
    subbed = "country, city, town, city, country"
    gsubbed = "country, city, town, city, country"

    sub(/city/, "CITY", subbed)
    gsub(/city/, "CITY", gsubbed)

    print subbed
    print gsubbed

    exit
}
```

This produces the following output:

```text
country, CITY, town, city, country
country, CITY, town, CITY, country
```

### `strtonum`

The `strtonum` function converts a string number to a numerical type:

```awk
BEGIN {
    strone = "1.234"
    strtwo = "4.332"

    print strtonum(strone) + strtonum(strtwo)
    exit
}
```

This prints `5.566` to standard out.

**Note:** Strings with a leading `0` are assumed to be *octal*, while strings
with a leading `0x` or `0X` are assumed to be hexadecimal numbers.

### Others

- `tolower` converts a string to lowercase
- `toupper` converts a string to uppercase
- `sprintf` allows for C-style string formatting
- `length` returns the length of a string (or the number of digits in a number)

## Command-Line Arguments

Using `ARGV`, `awk` can consume command-line arguments:

```bash
awk 'BEGIN { for (i in ARGV) print i, ARGV[i]; exit }' other arguments
```

Prints:

```text
0 awk
1 other
2 arguments
```
