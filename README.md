# Cheatsheets

---

## About

A personal repository of useful quick-reference sheets, colloquially referred
to as "cheatsheets."

## Linting

### Installation

Markdown files in this repository are linted via the `markdownlint` tool,
available via `npm`. This repository ships with a `Makefile` to simplify
running these linting scripts. Make sure `npm`/`npx` is installed, then
download package dependencies with:

```bash
make install
```

### Running the Linter

Finally, once you've made your edits, lint them using the tool:

```bash
make lint
```

If the tool produces no output, you need not correct any errors.

**Note:** Markdown linting is also performed after each new pushed commit via
*Github Actions*.

## Contribution Guide

Contributions to the project are encouraged, though small contributions (small
fixes, nitpicks, etc.) are preferred. Rules one should observe while
contributing are as follows:

- Request a cheatsheet by adding it to the **Roadmap** section below. If it is
  a library or framework, make sure to nest it under its respective language.
- Always ensure your edits pass with `make lint` before submitting pull
  requests against the project.
- Follow established formatting and organization conventions.
- Ensure that the code samples and information provided are correct to the best
  of your ability.
- Do not generate any part of your contribution using a large language model.
- Prefer readability and terse demonstration rather than long explanations. Our
  goal isn't to reproduce existing documentation. Basically: [show, don't
  tell](https://en.wikipedia.org/wiki/Show%2C_don't_tell).

## Roadmap

This is an actively-maintained list of languages, frameworks, and technologies
which have either been already added as cheatsheets or will be added in the
future.

### Languages and Frameworks

- [x] Python
  - [x] Django
  - [x] `unittest`
  - [x] Faker
  - [ ] `httpx`
  - [ ] Beautiful Soup
- [x] Ruby
  - [x] RSpec
  - [x] Rails
  - [ ] Grape
  - [ ] Rake
  - [ ] Nokogiri
- [x] Bash
- [x] Rust
- [x] Golang
  - [ ] Go Standard Library
  - [ ] `testify`
- [x] Vimscript
- [ ] Javascript
  - [x] Node
  - [x] Express
  - [x] Jest
  - [x] Faker
  - [ ] JQuery
  - [ ] React
  - [ ] Vue
- [ ] Elixir
- [ ] Dart
  - [ ] Flutter
- [ ] Kotlin
  - [ ] Android Applications
  - [ ] Jetpack Compose
- [ ] Google Apps Script
- [ ] Lua
  - [ ] Neovim

### Web Design Frameworks

- [ ] Bootstrap
- [ ] Bulma
- [ ] Tailwind CSS

### Shell Utilities

- [x] `sed`
- [ ] `awk`
- [ ] GNU `find`
- [ ] GNU `bc`

### Database Management Systems

- [x] `sqlite3`
- [x] `postgres`

### Command-Line Utilities

- [x] `git`
- [x] `ffmpeg`
- [x] `rsync`
- [x] `rclone`

### Static Site Generators

- [ ] Hugo

### Configuration Files

- [ ] Docker
- [ ] Makefiles
- [x] Docker Compose

### Testing Frameworks

- [ ] Cucumber

### Miscellaneous

- [x] Google
- [ ] JIRA Query Language (JQL)
- [ ] Greasemonkey / Tampermonkey API
