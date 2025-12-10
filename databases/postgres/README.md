# PostgreSQL

> PostgreSQL is a powerful, open source object-relational database system with
> over 35 years of active development that has earned it a strong reputation
> for reliability, feature robustness, and performance.

---

## Creating a Table

```sql
CREATE TABLE animals (
    -- Auto-incrementing (serial) types
    id SERIAL PRIMARY KEY,
    big_id BIGSERIAL,

    -- Text types
    name VARCHAR(64),
    species VARCHAR(64),
    description TEXT,

    -- Key-value formats
    metadata JSON,

    -- Numeric types
    age SMALLINT,
    habitat_id INT,
    historical_population BIGINT,

    -- Date and time types
    discovered_at DATE,

    FOREIGN KEY (habitat_id) REFERENCES habitat(id)
);
```

## Composite Primary Keys

```sql
CREATE TABLE tags (
    question_id INTEGER NOT NULL,
    question_type VARCHAR(30) NOT NULL,
    PRIMARY KEY(question_id, question_type)
);
```

## Inserting Values

```sql
INSERT INTO tags (question_id, question_type) VALUES (123, 'type');
```

## Updating Values

```sql
UPDATE tags SET question_id = question_id+10 WHERE question_type = 'type';
```

## Deleting Values

```sql
DELETE FROM tags WHERE question_type IN ('type_a', 'type_b');
```

## Built-In Functions

### Null Coalescing

```sql
-- Returns the first non-null value, 3
SELECT COALESCE(null, null, 3, 'also not null');
```
