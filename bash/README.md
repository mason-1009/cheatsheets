# Bash

> Unix gives you just enough rope to hang yourself – and then a couple of more
> feet, just to be sure. - Eric Allman

---

## Variables

```bash
name="Firstname Lastname"
echo "Hello, $name!"
```

## Functions

```bash
hello() {
    echo "First parameter: $1"
    echo "Second parameters: $2"
}

hello a b
# First parameter: a
# Second parameter: b
```

## Control flow

```bash
if [[ condition ]]; then
    echo "Condition is true"
elif [[ other_condition ]]; then
    echo "Other condition is true"
else
    echo "Neither are true"
fi
```

## Conditionals

```bash
# Strings
[[ -z STRING ]]  # Empty string
[[ -n STRING ]]  # Non-empty string
[[ STRING == STRING ]]  # Strings equal
[[ STRING != STRING ]]  # Strings not equal

# Numbers
[[ NUM -eq NUM ]]  # Numbers equal
[[ NUM -ne NUM ]]  # Numbers not equal
[[ NUM -lt NUM ]]  # Less than
[[ NUM -le NUM ]]  # Less than or equal
[[ NUM -gt NUM ]]  # Greater than
[[ NUM -ge NUM ]]  # Greater than or equal

# Boolean
[[ ! EXPR ]]  # NOT
[[ X && Y ]]  # AND
[[ X || Y ]]  # OR

# Files
[[ -e FILE ]]  # File exists
[[ -r FILE ]]  # File readable
[[ -h FILE ]]  # Symlink
[[ -d FILE ]]  # Directory
[[ -w FILE ]]  # Writable
[[ -s FILE ]]  # Size > 0 bytes
[[ -f FILE ]]  # Is a file
[[ -x FILE ]]  # Is executable
```

## Parameter subsitution

```bash
fname="jpgfile.jpg"

echo ${fname%.jpg}  # jpgfile
echo ${fname#jpg}  # file.jpg
echo ${fname/.jpg/.png}  # jpgfile.png
echo ${fname//jpg/png}  # pngfile.png
```

## Other string operations

```bash
src="/path/to/foo.cpp"

# String length
echo ${#src}  # 16

# Extract elements from file paths
echo ${src##*/}  # foo.cpp
echo ${src%$base}  # /path/to/
```

## Loops

```bash
# Loop files
for file in /etc/rc.*; do
    echo "$i"
done

# Loop over a range
for i in {1..5}; do
    echo "$i"
done

# Loop over stepped range
for i in {5..50..5}; do
    echo "$i"
done

# Forever loop
while true; do
    ...
done
```

## Calculation

```bash
a=3
echo $((a+10))  # 13
```
