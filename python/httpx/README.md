# `httpx`

> HTTPX is a fully featured HTTP client library for Python 3. HTTPX builds on
> the well-established usability of `requests`.

---

## Installation

Install `httpx` using your favorite package manager:

```bash
pip install httpx
```

## Making Requests

```python
import httpx

# Regular GET request
res = httpx.get('https://www.httpbin.org/get')

# GET request with URL parameters
res = httpx.get(
    'https://www.httpbin.org/get',
    params={'key': 'value'}
)

# POST request with form parameters
res = httpx.post(
    'https://httpbin.org/post',
    data={'key': 'value'}
)

# POST request with a JSON-encoded body
res = httpx.post(
    'https://httpbin.org/post',
    json={'key': 'value'}
)

# POST request with a binary body
res = httpx.post(
    'https://httpbin.org/post',
    content=content_bytes
)

# DELETE request
res = httpx.delete('https://httpbin.org/delete')

# HEAD request
res = httpx.head('https://httpbin.org/get')

# OPTIONS request
res = httpx.options('https://httpbin.org/get')
```

## Handling Responses

Each request returns an `httpx.Response` object, which adapts to the type of
data returned from a request:

```python
res = httpx.get('https://www.httpbin.org/get')

# Raise an exception (`httpx.HTTPStatusError`) if status is not OK. This method
# returns the response for easier chaining.
res.raise_for_status()

# HTTP status
res.status_code  # 200
res.is_error  # False
res.is_redirect  # False
res.is_success  # True

# Access response content
res.text  # Returns decoded text content
res.content  # Returns raw response in bytes (for text and binary)
res.json()  # Returns parsed JSON response

res.headers  # Custom dictionary of headers (case-insensitive keys)
res.cookies  # Custom dictionary of response cookies

# Redirects
res.history  # List of redirect history
res.next_request  # Next redirect request (or None)
```

## Redirects

The `httpx` client can be instructed to follow redirects automatically:

```python
httpx.get('https://www.httpbin.org/get', follow_redirects=True)
```

## Streaming

Responses can be streamed for efficiently handling large responses:

```python
with httpx.stream('https://www.httpbin.org/get') as r:
    # For binary responses
    for data in r.iter_bytes():
        ...

    # For text responses
    for text in r.iter_text():
        ...

    # For text responses (line-by-line)
    for line in r.iter_lines():
        ...
```

## Authentication

```python
# HTTP Basic authentication
httpx.get('https://url.com', auth=('username', 'password'))

# HTTP Digest authentication
httpx.get(
    'https://url.com',
    auth=httpx.DigestAuth('username', 'password')
)
```

## Headers and Cookies

Custom headers and cookies can be sent in any request:

```python
httpx.get(
    'https://url.com',
    cookies={'key', 'value'},
    headers={'X-Example': 'value'}
)
```

## Persistent Clients

With `httpx.Client`, it is possible to simulate persistent browser sessions
that store cookies from responses between requests and send them during
subsequent requests. This is useful for persisting an authenticated state:

```python
# With standard client
client = httpx.Client(headers=headers)

try:
    client.post(...)
finally:
    client.close()

# With a context manager
with httpx.Client(headers=headers) as client:
    client.get(...)

# Access set cookies
client.cookies
```

## Event Hooks

An `httpx.Client` instance can register event hooks, which trigger method calls
when specific events occur:

```python
def handle_request(request):
    ...

def handle_response(response):
    ...

client = httpx.Client(
    event_hooks={
        'request': [log_request],
        'response': [log_response],
    }
)
```

## HTTP Proxies

The `httpx` library has native support for proxies:

```python
proxy_mounts = {
    'http://': httpx.HTTPTransport(
        proxy='http://localhost:8030'
    ),
    'https://': httpx.HTTPTransport(
        proxy='http://localhost:8031'
    ),
}

client = httpx.Client(mounts=proxy_mounts)
```

It is possible to use *SOCKS* proxy servers, but `httpx[socks]` must be
installed in addition to `httpx`:

```python
client = httpx.Client(proxy='socks5://user:pass@host:port')
```

## Mocking with Transports

Using a custom transport, `httpx` allows for mocking HTTP requests:

```python
def mock_handler(request):
    return httpx.Response(200, json={...})

client = httpx.Client(transport=httpx.MockTransport(mock_handler))
```
