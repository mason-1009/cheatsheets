# Pytest

> I've been programming for decades, and nothing has made me love writing test
> code as much as `pytest`. - Brian Okken

---

## About

`pytest` is a popular alternative to Python's built-in `unittest` framework. It
allows for writing concise unit tests based on assertions.

## Basic Tests

```python
# This test passes
def test_passing():
    assert 1 + 1 == 2

# This test fails
def test_failing():
    assert 1 + 1 == 3
```

## Class-Based Tests

Tests can be grouped into classes:

```python
class TestClass:
    # This test passes
    def test_one(self):
        assert 1 == 1

    # This test also passes
    def test_two(self):
        assert 1 + 1 == 2
```

According to `pytest` docs:

> Something to be aware of when grouping tests inside classes is that each test
> has a unique instance of the class. Having each test share the same class
> instance would be very detrimental to test isolation and would promote poor
> test practices.

## Rich Assertions

`pytest` extends the Python `assert` functionality to provide better comparison
behavior between objects that are traditionally hard to compare. For example,
`pytest` supports comparing `set`, `list`, and `dict` objects with only the
`==` operator. All of the following tests pass:

```python
def test_set_comparison():
    assert set([1, 2, 3]) == set([3, 2, 1])

def test_list_comparison():
    assert [1, 2] + [3] == [1, 2, 3]

def test_dict_comparison():
    assert {'key': {'value': 3}} == {'key': {'value': 3}}
```

## Fixtures

`pytest` allows for defining fixtures that can be used by test functions via
parameters:

```python
import pytest

@pytest.fixture
def numbers():
    return [1, 2, 3, 4, 5]

# pytest automatically passes the result of `numbers` into the test function
def test_sum(numbers):
    assert sum(numbers) == (1 + 2 + 3 + 4 + 5)
```

## Exceptions

`pytest` tests can assert that code raises exceptions:

```python
import pytest

def raises_exception():
    raise ValueError('Value is wrong')

# This test passes
def test_raises_exception():
    with pytest.raises(Exception) as exc:
        raises_exception()

def my_func():
    raise ValueError('The value was wrong')

# `pytest.raises(...)` can match exception messages using regular expressions
def test_my_func():
    with pytest.raises(ValueError, match=r'The value was \w+'):
        my_func()
```

## Parameterized Tests

`pytest` allows for decorating a test function to add multiple parameterized
inputs:

```python
import pytest

@pytest.mark.parametrize(
    'a,b,expected',
    [
        (1, 1, 2),
        (1, 2, 3),
        (2, 2, 4),
        (5, 5, 10),
    ]
)
def test_add(a, b, expected):
    assert a + b == expected
```

## Monkey-Patching

`pytest` comes with a `monkeypatch` fixture for stubbing methods and
attributes:

```python
import os

def get_cpu_count():
    return os.cpu_count()

# Monkey-patch the `os.cpu_count(...)` method
def test_get_cpu_count(monkeypatch):
    monkeypatch.setattr(os, 'cpu_count', lambda: 12)
    assert get_cpu_count() == 12

# It's possible to monkey-patch inside of context managers
def test_context_monkey_patch(monkeypatch):
    with monkeypatch.context() as m:
        m.setattr(os, 'cpu_count', lambda: 100)
        assert get_cpu_count() == 100

def get_api_key():
    return os.environ.get('API_KEY')

# It's possible to set environment variables too
def test_get_api_key(monkeypatch):
    with monkeypatch.context() as m:
        m.setenv('API_KEY', 'fake_api_key')
        assert get_api_key() == 'fake_api_key'
```

## Capturing Output

The `capsys` fixture allows for capturing `stdout` and `stderr` output from
code under test:

```python
def say_hello():
    print('Hello, world!')

def test_say_hello(capsys):
    say_hello()

    # Read stdout/stderr
    captured = capsys.readouterr()

    assert captured.out == 'Hello, world!\n'
    assert captured.err == ''
```
