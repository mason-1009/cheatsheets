# `express.js`

> Express is a minimal and flexible `node.js` web application framework that
> provides a robust set of features for web and mobile applications.

---

## Basic Usage

```javascript
const express = require('express')
const app = express()
const port = 3000

app.get('/', (req, res) => {
  res.send('Hello World!')
})

app.listen(port, () => {
  console.log(`Example app listening on port ${port}`)
})
```

## Route Parameters

```javascript
app.get('/users/:userId/books/:bookId', (req, res) => {
  res.send(req.params) // { "from": "...", "to": "..." }
})
```

## Routers

In `express`, mini routers can be created apart from the top-level API router:

```javascript
const express = require('express')
const router = express.Router()

// Middleware that is specific to this router
const timeLog = (req, res, next) => {
  console.log('Time: ', Date.now())
  next()
}
router.use(timeLog)

// define the home page route
router.get('/', (req, res) => {
  res.send('Birds home page')
})

// define the about route
router.get('/about', (req, res) => {
  res.send('About birds')
})

module.exports = router
```

Attaching the router is simple:

```javascript
const birds = require('./birds')

// ...

app.use('/birds', birds)
```

## Middleware

Middleware can be used to add logging to an `express` application for each
route:

```javascript
const express = require('express')
const app = express()

app.use((req, res, next) => {
  console.log('Time:', Date.now())
  next()
})
```

### Built-In Middleware

By default, `express` ships with a middleware for handling `json` requests and
responses:

```javascript
const express = require('express');

const PORT = 3000;

const app = express();
app.use(express.json());

app.post('/', function (req, res) {
  console.log(req.body.name);
  res.end();
});

app.listen(PORT, function (err) {
  if (err) console.log(err);
  console.log("Server listening on PORT", PORT);
});
```

## Handling Errors

Error-handling middleware functions are similar to regular middleware, but they
accept four parameters instead of three:

```javascript
app.use((err, req, res, next) => {
  console.error(err.stack)
  res.status(500).send('Something broke!')
})
```
