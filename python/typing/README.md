# Typing

> "Dynamic typing" The belief that you can't explain to a computer why your
> code works, but you can keep track of it all in your head. - Chris Martin

---

## About

Type hinting allows for annotating types in Python, which is normally
dynamically-typed, to allow static analysis tools to automatically detect
type-related bugs and errors.

## Tools for Static Type Checking

Currently, [`pyright`](https://github.com/microsoft/pyright) is the preferred
tool for static type checking in Python.

## Basic Types

```python
def integer() -> int:
    ...

def floating_point() -> float:
    ...

def string() -> str:
    ...

def byte_sequence() -> bytes:
    ...
```

## Common Types

```python
from typing import (
    List,
    Dict,
    Any,
    Tuple,
    Set,
)

# Dictionary of strings -> anything
str_to_any: Dict[str, Any] = {
    'key': 'value',
    'int': 123,
}

# List of integers
int_list: List[int] = [1, 2, 3]

# Tuple with exactly two integers
two_int_tuple: Tuple[int, int] = (1, 2)

# Set of integers
my_int_set: Set[int] = set([1, 2, 3])
```

## Unions

```python
from typing import List

# Allows either type to be assigned
int_or_ints: int | List[int] = 1
int_or_ints = [1, 2, 3]
```

## Optional

```python
from typing import Optional

# Allows the value to be None
could_be: Optional[str] = None
```

## Type Alias

```python
from typing import TypeAlias, List

# Allows defining types in terms of others
IntList: TypeAlias = List[int]
my_int_list: IntList = [1, 2, 3]
```

## Current Self (`self`)

```python
from typing import Self

class Klass:
    def return_myself(self: Self) -> Self:
        return self
```

## Functions

```python
from collections.abc import Callable

# Accepts a callable that accepts two integers and returns an integer
def call(a: int, b: int, int_combiner: Callable[[int, int], int]) -> int:
    return int_combiner(a, b)

# `...` allows for arbitrary parameter lists
inf_params: Callable[..., int] = func_name
```

## Iterators and Generators

Generators have multiple type hint configurations:

```python
from collections.abc import Generator

# Yields ints, sends floats, and returns a string
def echo_round() -> Generator[int, float, str]:
    sent = yield 0
    while sent >= 0:
        sent = yield round(sent)
    return 'Done'

# Yields ints up to 100
def integer_generators() -> Generator[int]:
    for n in range(100):
        yield n
```

Simple generators can also be annotated as `Iterator` or `Iterable` types:

```python
from collections.abc import Iterator

def infinite_stream(start: int) -> Iterator[int]:
    while True:
        yield start
        start += 1
```

`Iterable` types have an `__iter__()` method, while `Iterator` types have
`__iter__()` and `__next()__` methods.

## Literal

```python
from typing import Literal

# Literal types are equivalent to the provided type
mode: Literal['a', 'b'] = 'a'  # Valid
mode: Literal['a', 'b'] = 'b'  # Valid
mode: Literal['a', 'b'] = 'c'  # Invalid
```

## IO and File-Like Objects

```python
from typing import IO

text_file: IO[str] = open('filename.txt', 'r')
binary_file: IO[bytes] = open('filename.txt', 'rb')
```
