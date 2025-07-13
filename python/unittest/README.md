# `unittest`

> If you don’t like testing your product, most likely your customers won’t like
> to test it either. - Anonymous

---

## Basic Unit Test

```python
from unittest import TestCase

class MyTestCase(TestCase):
    # Runs before each test method
    def setUp(self):
        super().setUp()

    # Runs after each test method
    def tearDown(self):
        super().tearDown()

    def test_addition(self):
        self.assertEqual(1, 1)
```

## Assertions

`TestCase` provides several assertion methods out of the box for building test
cases:

```python
self.assertEqual((1 + 2), 3)  # a == b
self.assertNotEqual((1 + 2), 4)  # a != b

self.assertTrue(True)  # a is true
self.assertFalse(False)  # a is false

self.assertIs(str, str)  # a is b
self.assertIsNot(str, int)  # a is not b

self.assertIsNone(None)  # a is None

self.assertIn(2, (1, 2, 3, 4))  # a in b
self.assertNotIn(2, (1, 3, 4))  # a not in b

self.assertIsInstance('my_string', str)  # isinstance(a, b)
self.assertNotIsInstance('my_string', int)  # not isinstance(a, b)

self.assertAlmostEqual(0.000000001, 0)  # round(a-b, 7) == 0
self.assertNotAlmostEqual(0.1, 0)  # round(a-b, 7) != 0

self.assertGreater(10, 3)  # a > b
self.assertGreaterEqual(10, 10)  # a >= b

self.assertLess(3, 10)  # a < b
self.assertLessEqual(10, 10)  # a <= b

self.assertRegex('a test string', r'test')  # b.search(a)
self.assertNotRegex('a test string', r'tester')  # not b.search(a)

self.assertCountEqual([1, 2, 3], [3, 2, 1])  # len(a) == len(b) and set(a) == set(b)

self.assertListEqual([1, 2, 3], [1, 2, 3])  # each element a == each element b
self.assertTupleEqual((1, 2, 3), (1, 2, 3))  # each element a == each element b
self.assertSetEqual(set([1, 2, 3]), set([3, 3, 2, 1]))  # set(a) == set(b)

self.assertDictEqual({'a': 3}, {'a': 3})  # dict(a) == dict(b)
```

## Assert on Exceptions

`unittest` has multiple assertions for verifying exceptions were raised:

```python
with self.assertRaises(ValueError):
    raise ValueError('this is a value error')

# Similar to assertRaises(...), but runs a regex against the exception
# message
with self.assertRaisesRegex(ValueError, r'a value'):
    raise ValueError('this is a value error')
```

## Sub-Tests

`self.subTest(...)` provides a context manager for delimiting multiple
sub-cases within a single test method:

```python
class MyTestCase(TestCase):
    def test_with_sub_tests(self):
        pairs = [
            (1, 1, 2),
            (1, 2, 3),
            (1, 3, 4),
        ]
        for a, b, expected in pairs:
            with self.subTest(a=a, b=b):
                result = a + b
                self.assertEqual(result, expected)
```

## Mocks

Python's `unittest` allows creating mocks/doubles of existing modules and
classes with `mock.Mock` and `mock.MagicMock`. Mock objects can be conformed to
an existing module or class with `spec=module.ClassName` as a keyword argument.
When a spec is set, the mock will raise an exception if a method that isn't
defined on the spec source is called:

```python
import os
from unittest import TestCase, mock

class MyTestCase(TestCase):
    def test_mock_os(self):
        mock_os = mock.MagicMock(spec=os)
        mock_os.getpid.return_value = 100

        # Both will pass
        self.assertEqual(mock_os.getpid(), 100)
        mock_os.getpid.assert_called_once()
```

### `Mock(...)` vs. `MagicMock(...)`

* `MagicMock` is a subclass if `Mock`, with default implementations of magic
  methods.
* `MagicMock` sets default values of magic methods for cases where a definition
  is needed but the return value is unnecessary.

## Environment Variables

Environment variables can be mocked with `mock.patch.dict(...)`. This
snippet updates environment variables with the key-value pairs provided in
the dictionary:

```python
with mock.patch.dict(os.environ, {'KEY': 'VALUE'}):
    ...
```

Passing `clear=True` empties all environment variables before patching in
the provided dictionary. The following snippet ensures that all environment
variables are unset:

```python
with mock.patch.dict(os.environ, {}, clear=True):
    ...
```
