# SQLite3

> Precise numbers are difficult to obtain and so exact rankings are
> impossible. But our best guess is that SQLite is the second mostly widely
> deployed software library, after `libz`.

---

## Creating a Table

**Note:** The `IF NOT EXISTS` phrase instructs SQLite to create the table if
and only if it does not exist already.

```sql
CREATE TABLE IF NOT EXISTS table_name(
    pk_num INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    non_nullable_string TEXT NOT NULL,
    nullable_string TEXT NULL,

    other_table_id INTEGER NOT NULL,
    FOREIGN KEY (other_table_id) REFERENCES other_table (id)
);
```

### Compound Primary Keys

**Note:** SQLite allows primary keys to be null!

```sql
CREATE TABLE compound(
    key_a INTEGER NOT NULL,
    key_b TEXT NOT NULL,
    PRIMARY KEY(key_a, key_b)
);
```

## Inserting Values

```sql
INSERT INTO table_name (col_a, col_b) VALUES (100, 'string_val');
```

### Upsert

**Note:** The `excluded` prefix denotes values that would have been inserted
from the original expression, had there been no conflict.

```sql
INSERT INTO table_name (pk, col_a, col_b)
    VALUES ('conflicting_pk_val', 100, 'string_val')
    ON CONFLICT (pk)
    DO UPDATE SET col_a=excluded.col_a, col_b=excluded.col_b;
```

In this example, `excluded.col_a` refers to `100`, and `excluded.col_b` refers
to `'string_val'`.

## Updating Values

```sql
UPDATE table_name
    SET col_a=10*col_a
    WHERE (col_a % 2) = 0;
```

This multiplies the value of `col_a` by 10 for every row whose value of `col_a`
is even.

## Deleting Values

```sql
DELETE FROM table_name
    WHERE (col_a % 2) = 0;
```

This deletes every row from `table_name` whose value of `col_a` is even.

## Built-In Functions

### Null Coalescing

```sql
-- Returns the first non-null value, 3
SELECT coalesce(null, null, 3, 'also not null');
```

### String Operations

```sql
-- Concats all non-null strings, producing 'a.c'
SELECT concat('a', null, '.', null, 'c');
```

```sql
-- Returns the Unicode character length of the string, 2
SELECT length('你好');
```

```sql
-- Lowercase, or 'hello'
SELECT lower('HELLO');

-- Uppercase, or 'HELLO'
SELECT upper('hello');
```

```sql
-- Largest of provided integers, or 3
SELECT max(1, 2, 3);

-- Smallest of provided integers, or 1
SELECT min(1, 2, 3);
```

**Note:** The `printf(...)` function accepts the same inputs as the C
equivalent.

```sql
-- Prints the string 'Your Numbers: 10 and 2'
SELECT printf('Your Numbers: %d and %d', 10, 2);
```

### JSON Functions

```sql
-- Extract elements from JSON, returning 3
SELECT json_extract('{"a": {"b": 3}}', '$.a.b');

-- Handle JSON arrays, returning 7
SELECT json_extract('{"a":2,"c":[4,5,{"f":7}]}', '$.c[2].f');

-- Query from a JSON array stored in a user table
-- Select all users who have any phone number with a 704 area code
SELECT DISTINCT user.name
  FROM user, json_each(user.phone)
 WHERE json_each.value LIKE '704-%';
```

### Date and Time Functions

**Note:** SQLite does not have a dedicated date/time type.

```sql
-- Handle date strings (YYYY-MM-DD)
SELECT date('now'); -- 2025-11-05
SELECT date('2024-10-10'); -- 2024-10-10

-- Handle datetime strings (YYYY-MM-DD HH::MM:SS)
SELECT datetime('now'); -- 2025-11-05 14:03:18

-- Handle Unix epoch times
SELECT unixepoch('now'); -- 1762351448
SELECT unixepoch('2024-10-10'); -- 1728518400
```

### Editing Values

**Note:** This function supports editing data via external commands by creating
a temporary file and opening it in that program.

```sql
-- Opens body in a text editor
UPDATE docs SET body=edit(body, 'nvim') WHERE name='report-15';

-- Opens the blob 'img' in GIMP for image editing
UPDATE pics SET img=edit(img, 'gimp') WHERE id='pic-1542';
```

## Extract-Transform-Load

### Loading Binary Data

The `sqlite3` command-line tool can read binary data into `BLOB` columns (as
well as other types) from files. Consider `images (name TEXT, img BLOB)`:

```sql
INSERT INTO images (name, img) VALUES ('name', readfile('image_file.jpg'));
```

### Importing JSON

The `sqlite3` command-line tool has powerful tools for extracting,
transforming, and loading data into tables from JSON-encoded files. Consider
the following JSON schema:

```json
[
  {
    "name": "Name One",
    "time": 12345
  },
  {
    "name": "Name Two",
    "time": 12348
  }
]
```

Now consider table `items (name TEXT, time BIGINT)`:

```sql
INSERT INTO items (name, time) SELECT
  -- value is set by json_each
  json_extract(value, '$.name'),
  json_extract(value, '$.time')
FROM json_each(readfile('data_file.json'));
```

This loads each value from the array into the table. The result from `SELECT *
FROM items;` produces:

```text
Name One|12345
Name Two|12348
```
