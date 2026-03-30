# Bash

> Unix gives you just enough rope to hang yourself – and then a couple of more
> feet, just to be sure. - Eric Allman

---

## Executing Commands

```bash
A; B    # Run A and then B, regardless of success of A
A && B  # Run B if and only if A succeeded
A || B  # Run B if and only if A failed
A &     # Run A in background.
```

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

## Process Substitution

It is possible to use process substitution to pipe command output to a program
to be accepted as a file:

```bash
# Trivial example (prints the contents of ls -l)
cat <(ls -l)

# More complex command
cat <(ls -l | cut -d ' ' -f1)
```

Alternatively, the same syntax can be used when output to a file needs to be
piped into a another command:

```bash
# Writes from wget into a file that pipes into the Wayland clipboard
wget 'https://www.google.com/humans.txt' -O >(wl-copy)
```

## Miscellaneous

### Merging Lines of Text

Often it is necessary to blend text from multiple files into a single output
file or stream. This is the function of the `paste` command. Consider the
following file (`a.txt`):

```text
red
blue
green
```

And the file (`b.txt`):

```text
one
two
three
```

The lines can be combined with `paste`:

```bash
paste -d '|' a.txt b.txt 
```

This writes the following output to `stdout`:

```text
red|one
blue|two
green|three
```

### Using `mountpoint`

In a `bash` script, it is possible to determine if a directory is a mounted
file system using the `mountpoint` command. This is useful for scripts which
need to check if a resource is mounted before proceeding (such as automated
backup scripts).

`mountpoint` exits with a `0` (success) code if the directory is mounted, and a
`32` if the directed is not mounted:

```bash
# This prints nothing
mountpoint --quiet /mnt/test_folder && echo 'Mounted!'

mount /dev/sdXx /mnt/test_folder

# This prints "Mounted!"
mountpoint --quiet /mnt/test_folder && echo 'Mounted!'
```

This command is provided by the `util-linux` package and may not be available
on every `bash` installation.

### Print File + Folder Metadata with `stat`

The GNU `coreutils` package ships with the `stat` command, which returns
metadata about a file or folder:

```bash
stat file.txt
```

Which prints:

```text
  File: file.txt
  Size: 295     Blocks: 8      IO Block: 4096  regular file
Device: 259,2   Inode: 1311544     Links: 1
Access: (0644/-rw-r--r--)  Uid: ( 1000/username)   Gid: ( 1000/groupname)
Access: 2025-12-02 08:13:30.648583993 -0500
Modify: 2025-11-30 12:11:57.250069914 -0500
Change: 2025-11-30 12:11:57.250069914 -0500
 Birth: 2025-11-30 12:11:57.250069914 -0500
```
