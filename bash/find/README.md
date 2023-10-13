# GNU Find

> UNIX is basically a simple operating system, but you have to be a genius to understand the simplicity. - Dennie Ritchie

---

### General Layout

```
find <path> <conditions> <actions>
```

### Filtering by types

```
# files
find . -type f

# folders
find . -type d

# symlinks
find . -type l

# depth
find . -depth 2
```

### Running commands

```
# Run a command on found items
find . -exec [command] {} \;

# Print the names
find . -print

# Delete them
find . -delete
```

### Filtering by pattern

```
# Find all files ending in _image.jpg
find . -type f -name "*_image.jpg"
```

### Filtering by file size

```
find . -size -128c  # Smaller than 128 bytes
find . -size +10M  # Larger than 10MiB
find . -size +2G  # Larger than 2GiB
```

### Filtering by regular expression

```
find . -regextype sed -regex ".*/[a-z0-9]\{4\}.jpg"
```
