# `sed`

> `sed` is a stream editor. A stream editor is used to perform basic text
> transformations on an input stream (a file or input from a pipeline). While
> in some ways similar to an editor which permits scripted edits (such as ed),
> `sed` works by making only one pass over the input(s), and is consequently
> more efficient. But it is `sed`’s ability to filter text in a pipeline which
> particularly distinguishes it from other types of editors.

---

## Using `sed` on *Mac OS*

Beware of caveats inherent with the use of the default `sed` command on *Mac
OS*; this version is a BSD variant of `sed` and does not support the same
operations. This is in part due to a licensing issue.

This cheat sheet is designed for the *GNU* variant of `sed`, which ships by
default on *Linux* machines. In order to install this on *Mac OS* with
*Homebrew*, run:

```zsh
brew install gnu-sed
```

**Note:** This will install `gsed` alongside the default `sed` install. Scripts
hoping to use the *GNU* version must call `gsed` instead.

## Regular Expressions

`sed` supports the use of "extended regular expressions" with either the `-E`
or `-r` command-line flag.

Replace the first match of an uppercase word with `___`:

```bash
# Prints "lowercase ___ example WORD"
echo 'lowercase UPPER example WORD' | sed -E 's/[A-Z]+/___/'
```

Replace all instances of uppercase words with `___`:

```bash
# Prints "lowercase ___ example ___"
echo 'lowercase UPPER example WORD' | sed -E 's/[A-Z]+/___/g'
```

## Using Capture Groups

`sed` can modify text using capture groups, which allows for more powerful
substitutions.

This command surrounds each word (matched with `\w+`) in an input stream with
`<|...|>`:

```bash
# Prints "<|this|> <|is|> <|an|> <|example|> <|sentence|>"
echo 'this is an example sentence' | sed -E 's/(\w+)/<|\1|>/g'
```

Each instance of `(PATTERN)` in a `sed` command becomes a numbered capture.
Multiple captures can be used in a single command:

```bash
# Prints "(value_one: 333), (value_two: 554)"
echo 'value_one=333, value_two=554' | sed -E 's/(\w+)=([0-9]+)/(\1: \2)/g'
```

**Note:** Unlike some other regular expression engines, `sed` does not support
the `\d` character class for numeric digits; `[0-9]` must be used.

## Character Classes

`sed` supports the following character classes:

- `\w` matches any "word" character.
- `\W` matches any "non-word" character (anything not matched by `\w`).
- `\s` matches whitespace characters (space and tabs).
- `\S` matches any non-whitespace characters.
- `\<` matches the beginning of a word.
- `\>` matches the end of a word.

The `^` character matches the beginning of a line, while `$` matches the end of
a line.

## Editing In-Place

Passing `-i` to `sed` instructs it to make in-place edits of files, with or
without backups.

Consider file `test.txt`:

```text
1: word_one
2: word_two
3: word_three
```

Edit the file in place while creating `.backup` as a backup if a rollback is
needed:

```bash
sed -E 's/^([0-9]+): (\w+)$/- \1: "\2"/' -i.backup test.txt
```

`test.txt` is now:

```text
- 1: "word_one"
- 2: "word_two"
- 3: "word_three"
```

The original text is contained in `test.txt.backup`. Passing `-i` without a
backup naming scheme does not create one.

### Recursive In-Place Editing

Combining `sed` and `find` allows for powerful automated refactoring of large
collections of files:

```bash
find ./path -type f -exec sed -E -i.cold 's/foo/bar/g' {} \;
```
