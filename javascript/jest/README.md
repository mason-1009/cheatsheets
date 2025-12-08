# Jest

> Jest is a delightful JavaScript Testing Framework with a focus on simplicity.

---

## Configuration

Add the following lines to `package.json`:

```json
{
  "scripts": {
    "test": "jest"
  }
}
```

Now tests can be executed with `npm test`.

## Basic Test

```javascript
test('adds 1 + 2 to equal 3', () => {
  expect(1 + 2).toBe(3);
});
```

## Matchers

```javascript
// Uses Object.is
expect(got).toBe(expected);
expect(got).not.toBe(unexpected);

// Checks equality, including nested values in arrays and objects
expect(got).toEqual(expected);
expect(got).toStrictEqual(expected);

expect(got).not.toEqual(unexpected);
expect(got).not.toStrictEqual(unexpected);

// Matchers for truthiness
expect(got).toBeNull();
expect(got).toBeDefined();
expect(got).not.toBeUndefined();
expect(got).not.toBeTruthy();
expect(got).toBeFalsy();

// Compare numbers
expect(got).toBeGreaterThan(3);
expect(got).toBeGreaterThanOrEqual(3.5);
expect(got).toBeLessThan(5);
expect(got).toBeLessThanOrEqual(4.5);

// Epsilon-based floating point comparisons
expect(got).toBeCloseTo(0.3);

// Compare strings to regular expressions
expect(got).toMatch(/\w+/);
expect(got).not.toMatch(/\d+/);

// Match arrays and iterables
expect(got).toContain('milk');
expect(got).not.toContain('eggs');

// Match exceptions
expect(() => someFunc()).toThrow();
expect(() => someFunc()).toThrow(Error);
expect(() => someFunc()).toThrow('error text');
expect(() => someFunc()).toThrow(/^error \w+$/);
```

## Asynchronous Code

Asynchronous code can be tested with `await` syntax or using `then(...)`:

```javascript
test('using then', () => {
  return fetchData().then(got => {
    expect(got).toBe(expected);
  });
});

test('using await', async () => {
  const got = await fetchData();
  expect(got).toBe(expected);
});
```

## Setting Up and Tearing Down

Use `beforeEach` and `afterEach` for setup and tear-down before and after every
test case. Use `beforeAll` and `afterAll` to run once before and after the
whole suite:

```javascript
beforeEach(() => {
  // ...
});

afterEach(() => {
  // ...
});

beforeAll(() => {
  // ...
});

afterAll(() => {
  // ...
});
```

## Test Scoping

Tests can be scoped with a `describe` block. Any before/after hooks defined
within that block will only apply to that block:

```javascript
describe('someFunctionality', () => {
  beforeEach(() => {
    return initialized();
  });

  test('it works', () => {
    expect(someFunctionality(args)).toBe(expected);
  });
});
```

## Mocks

```javascript
// Create the mocked method
const mocked = jest.fn(x => 42 + x);

test('mock worked', () => {
  // Call the method during a test
  mocked(1);
  mocked(2);

  // Assert calls were made
  expect(mocked.mock.calls).toHaveLength(2);

  // First arg of first call
  expect(mocked.mock.calls[0][0]).toBe(1);

  // First arg of second call
  expect(mocked.mock.calls[1][0]).toBe(2);
});
```

### Mock a Module

Jest allows tests to mock an entire module:

```javascript
import axios from 'axios';
import Users from './users';

jest.mock('axios');

test('should fetch users', () => {
  const users = [{name: 'Bob'}];
  const resp = {data: users};
  axios.get.mockResolvedValue(resp);

  return Users.all().then(data => expect(data).toEqual(users));
});
```
