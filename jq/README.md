# `jq`

> `jq` is like `sed` for JSON data - you can use it to slice and filter and map
> and transform structured data with the same ease that `sed`, `awk`, `grep`
> and friends let you play with text. - [jqlang.org](https://jqlang.org)

---

## Basic Filters

From the following JSON response:

```json
{
  "searchTerm": "movies",
  "success": true,
  "count": 3,
  "results": [
    {
      "name": "Cow",
      "released": "1999-02-01",
      "rating": 77
    },
    {
      "name": "Cow 2",
      "released": "2002-03-11",
      "rating": 63
    },
    {
      "name": "Pig 1",
      "released": "2003-04-25",
      "rating": 86
    }
  ]
}
```

Extracting specific values:

```bash
# Getting single elements
jq '.' # Whole JSON tree
jq '.searchTerm' # Returns "movies"
jq '.count' # Returns 3

# Getting items from arrays
jq '.results[0]' # Gets the first object from "results"
jq '.results[0].rating' # Gets the rating from the first movie

# Getting multiple array elements
jq '.results[0:2]' # Gets the first two movie results
jq '.results[-2:]' # Gets the last two movie results

# Iterating over arrays
jq '.results[].name' # Gets the name of each movie result
jq '.results[-2:][].name' # Gets the names of the last two movie results
```

Using the pipe operator:

```bash
# Iterating over arrays with pipes
jq '.results | .[].name' # Gets the names of all movie results
```

## Operators and Functions

```bash
jq '. | length' # Gets the number of key-value pairs (4)
jq '.searchTerm | length' # Gets the length of the search string (6)
jq '.results | length' # Gets the length of movie results (3)

jq 'keys' # Get a list of keys sorted alphabetically
jq 'keys_unsorted' # Get a list of keys in insertion order

jq 'has("count")' # Whether key exists (true)
jq 'has("missing")' # Whether key exists (false)

# Mapping over arrays or objects
jq 'keys | map(length)' # Returns the length of each key name (5, 7, 10, 7)
jq '.results | map(.name)' # Get name of each movie (similar .results[].name)

# Flatten arrays
jq 'flatten' # Returns a flattened array

# Membership checking
jq 'has("count")' # Returns true
jq 'has("missing")' # Returns false

# Filtering on conditions

# Returns all movies with a rating above 70
jq '.results | map(select(.rating > 70))'

# Filter for only certain types
jq '.[] | numbers' # Get all numerical values (returns 3)
jq '.[] | strings' # Get all string values (returns "movies")
jq '.[] | arrays' # Get all array values (returns array of movies)

jq '.results[] | objects' # Get all object values (returns "movies")
```

## Conditionals

```bash
jq 'if .success then "yes" else "no" end' # Returns "yes"
jq 'if .count > 3 then "over three" else "under three" end' # Returns "under three"

# Alternative operator
jq '.missing // "placeholder"' # Returns "placeholder"
jq '.searchTerm // "placeholder"' # Returns "movies"
```

## Variable Binding

```bash
# Store the key count in a variable and add it to something else
jq 'length as $key_count | (.count + $key_count)' # Returns 7 (3 + 4 keys)
```

## String Operations

```bash
# Splitting a string
jq '.results[1].name | split(" ")' # Returns ["Cow", "2"]

# Converting from string to number
jq '.results[1].name | split(" ") | .[1] | tonumber' # Returns: 2
```

## Recursive Operations

Consider the following input text:

```json
{"name": "/", "children": [
  {"name": "/bin", "children": [
    {"name": "/bin/ls", "children": []},
    {"name": "/bin/sh", "children": []}]},
  {"name": "/home", "children": [
    {"name": "/home/stephen", "children": [
      {"name": "/home/stephen/jq", "children": []}]}]}]}
```

To perform an operation on the structure recursively, use the `recurse(f)`
function:

```bash
# Returns:
# "/"
# "/bin"
# "/bin/ls"
# "/bin/sh"
# "/home"
# "/home/stephen"
# "/home/stephen/jq"
jq 'recurse(.children[]) | .name'
```

## String Interpolation

```bash
# Format a single string
jq '"Search Term: \(.searchTerm)"' # "Search Term: movies"
jq '"Success: \(if .success then "yes" else "no" end)"' # "Success: yes"

# Format an array to strings
# Returns:
# "Cow (77)"
# "Cow 2 (63)"
# "Pig 1 (86)"
jq '.results[] | "\(.name) (\(.rating))"'
```

## Format Strings and Escaping

```bash
# Escape URLs
# Returns:
# "http://site.com/?q=Cow"
# "http://site.com/?q=Cow%202"
# "http://site.com/?q=Pig%201"
jq '.results[] | @uri "http://site.com/?q=\(.name)"'

# Convert arrays to CSV
# Returns:
# "\"Cow\",\"1999-02-01\""
# "\"Cow 2\",\"2002-03-11\""
# "\"Pig 1\",\"2003-04-25\""
jq '.results[] | [.name, .released] | @csv'

# Convert arrays to TSV
# Returns:
# "Cow\t1999-02-01"
# "Cow 2\t2002-03-11"
# "Pig 1\t2003-04-25"
jq '.results[] | [.name, .released] | @tsv'
```
