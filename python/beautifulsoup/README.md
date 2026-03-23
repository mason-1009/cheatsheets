# Beautiful Soup

> Beautiful Soup is a Python library for pulling data out of
> HTML and XML files. It works with your favorite parser to
> provide idiomatic ways of navigating, searching, and
> modifying the parse tree. It commonly saves programmers
> hours or days of work.

---

## Installation

Install `beautifulsoup4` using your favorite package manager:

```bash
pip install beautifulsoup4
```

## Pretty-Formatting HTML

Out of the box, *Beautiful Soup* supports prettifying a parsed HTML document:

```python
from bs4 import BeautifulSoup

doc = BeautifulSoup(html_text, 'html.parser')
print(doc.prettify())
```

## Extracting Node Attributes

HTML tags are represented as `bs4.element.Tag` objects:

```python
doc.title             # bs4.element.Tag
doc.title.name        # 'title'
doc.title.string      # 'Beautiful Soup Documentation'

doc.title.parent      # bs4.element.Tag
doc.title.parent.name # 'head'

doc.head              # bs4.element.Tag
doc.head.children     # Generator of child elements
```

## Search by Selector

Consider the following markup:

```html
<div role="search">
  <form id="rtd-search-form" class="wy-form" action="search.html" method="get">
    <input type="text" name="q" placeholder="Search docs" />
    <input type="hidden" name="check_keywords" value="yes" />
    <input type="hidden" name="area" value="default" />
  </form>
</div>
```

*Beautiful Soup* supports searching by CSS-selectors, similar to in a browser
DOM. The `select_one` method can find a single tag matching the selector
string:

```python
# Find a single form with an ID of 'rtd-search-form'
node = doc.select_one('form#rtd-search-form')

node.name       # 'form'

# Extract attributes
node['id']      # 'rtd-search-form'
node['action']  # 'search.html'
node['method']  # 'get'

# Extract all attibutes as a dictionary
node.attrs      # dict of attributes
```

Similarly, multiple items can be selected with the `select` method, which
returns a `bs4.element.ResultSet`:

```python
# Find all paragraph tags
paragraphs = doc.select('p')

# The result set can be treated as a `list`
first_p = paragraphs[0]
```

## Extracting Text

The way HTML handles white-space creates some barriers to direct handling of
text. *Beautiful Soup* provides some tools for dealing with this:

```python
paragraph.text  # Raw text of tag

# Text can be extracted more cleanly with `get_text()`. Note that this method
joins lines with '\n' by default

# Non-stripped text of tag and its children
paragraph.get_text()

# Leading and trailing whitespace removed
paragraph.get_text(strip=True)

# Stripped text with lines joined by spaces
paragraph.get_text(' ', strip=True)
```
