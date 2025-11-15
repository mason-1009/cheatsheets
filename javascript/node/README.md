# Node

> A few years ago, it would have been unthinkable to implement server software
> in JavaScript. - Guillermo Rauch

---

## Setup

Node ships with the `npm` package manager, which is used to manage projects and
their dependencies:

```bash
npm init
```

## Input and Output

```js
// Log to stdout and stderr
console.log("INFO");
console.warn("WARN");
console.error("ERROR");
```

## Parsing CLI Arguments

Node ships with utilities for parsing and working with command-line arguments:

```js
const { parseArgs } = require("node:util");

const args = ["-f", "--bar", "b"];
const options = {
  foo: {
    type: "boolean",
    short: "f",
  },
  bar: {
    type: "string",
  },
};

const {values, positionals} = parseArgs({args, options});

values.foo; // true
values.bar; // "b"

positionals; // []
```

## String Decoding

Decoders are useful for converting multi-byte strings from butters to their
UTF-8 encoded representations:

```js
const { StringDecoder } = require("node:string_decoder");

const decoder = new StringDecoder("utf8");
decoder.write(Buffer.from([0xC2, 0xA2])); // "¢"
```

## Environment Variables

```js
process.env.HOME;
process.env["HOME"];
```

## Blobs

Blobs contain **immutable**, raw data which can be safely shared among threads.

```js
const b = new buffer.Blob(["a", " ", "string"]);
await b.text(); // "a string"
```

## Event Handling

Node ships with a built-in module to handle event patterns:

```js
const EventEmitter = require("node:events");
const emitter = new EventEmitter();

// Register a listener
emitter.on("eventName", (paramOne, paramTwo) => {
  console.log(`paramOne=${paramOne}, paramTwo=${paramTwo}`);
});

// Emit an event, printing paramOne=first, paramTwo=second, returns true if the
// event had listeners, false otherwise
emitter.emit("eventName", "first", "second");
```

## Streams

Streams can be either readable or writable. A readable stream can be made from
a file:

```js
const fs = require("node:fs");

const readableStream = fs.createReadStream("large-file.txt", {
 encoding: "utf8",
 highWaterMark: 16 * 1024 // 16KB chunks
});

// Handle stream events
readableStream.on("data", (chunk) => {
 console.log(`Received ${chunk.length} characters`);
});

readableStream.on("end", () => {
 console.log("File reading completed");
});

readableStream.on("error", (error) => {
 console.error("Error reading file:", error);
});
```

It is also possible to write to files using a writeable stream:

```js
const fs = require("node:fs");

// Create a writable stream
const writableStream = fs.createWriteStream("output.txt");

// Write data to the stream
writableStream.write("This is the first line\n");
writableStream.write("This is the second line\n");
writableStream.write("This is the third line\n");

// End the stream
writableStream.end("This is the final line\n");

writableStream.on("finish", () => {
 console.log("All data has been written");
});

writableStream.on("error", (error) => {
 console.error("Error writing to file:", error);
});
```

Creates a promise-based pipeline for transforming data in streams. This example
reads `archive.tar`, converts it to a `gzip` encoded compressed format, and
writes it to `archive.tar.gz` in one pipeline:

```js
const { pipeline } = require('node:stream/promises');
const fs = require('node:fs');
const zlib = require('node:zlib');

async function run() {
  await pipeline(
    fs.createReadStream('archive.tar'),
    zlib.createGzip(),
    fs.createWriteStream('archive.tar.gz'),
  );
  console.log('Pipeline succeeded.');
}

run().catch(console.error);
```

## Subprocesses

```js
const { spawn } = require("node:child_process");

const ls = spawn("ls", ["-l", "/tmp"]);

// Handle stdout and stderr
ls.stdout.on("data", (data) => console.log(`stdout: ${data}`));
ls.stderr.on("data", (data) => console.error(`stderr: ${data}`));

// Execute on process exit
ls.on("close", (code) => console.log(`Exit Code: ${code}`));
```

## Cryptography

```js
const crypto = require("node:crypto");

// Create hashes from strings or buffers
const input = "test string";

crypto.hash("md5", input);
crypto.hash("sha1", input);
crypto.hash("sha256", input);
crypto.hash("sha512", input);

// Generate random numbers
crypto.randomInt(3); // From (0, 1, 2)

// Generate a random UUID
// Returns "3e1f8270-b88d-43a1-a08e-67b44ab64a0e"
crypto.randomUUID();
```

## Manipulating Paths

```js
const path = require("node:path");

path.basename("/tmp/test.txt"); // "test.txt"
path.basename("/tmp/test.txt", ".txt"); // "test"

path.dirname("/tmp/test.txt"); // "/tmp"
path.extname("/tmp/test.txt"); // ".txt"

path.isAbsolute("/tmp/test.txt"); // true

path.join("/tmp", "test.txt"); // "/tmp/test.txt"
path.normalize("/tmp/folder/.././test.txt"); // "/tmp/test.txt"

// Parse the path into its components in one call
// Returns {
//   root: "/",
//   dir: "/tmp",
//   base: "test.txt",
//   ext: ".txt",
//   name: "test"
// }
path.parse("/tmp/test.txt");

path.matchesGlob("/tmp/test.txt", "/tmp/*.txt"); // true
path.matchesGlob("/tmp/test.txt", "/tmp/*.jpg"); // false

// Portable path ENV splitting
process.env.PATH.split(path.delimiter);

// Portable file path splitting
filePath.split(path.sep); // ["path", "to", "file.txt"]
```

## File System

```js
const fs = require("node:fs");
const { Buffer } = require("node:buffer");

// Open a files and read it (string or Buffer)
fs.readFile("file.txt", {encoding: "utf8"}, (e, d) => console.log(d));

// Append to the file (string or Buffer)
fs.appendFile("file.txt", "text to append", (err) => {});

// Write binary data to a file
const data = Buffer.from([1, 2, 3]);
fs.writeFile("data.bin", data, (err) => {});
```

## Interacting with the Operating System

```js
const os = require("node:os");

os.hostname(); // "host_name"
os.machine(); // "x86_64"

// Returns {
//   interface_name: [
//     {
//       address: "127.0.0.1",
//       netmark: "255.0.0.0",
//       family: "IPv4",
//       mac: "00:00:00:00:00:00",
//       internal: true,
//       cidr: "127.0.0.1/8"
//     }
//   ]
// }
os.networkInterfaces();

os.platform(); // "linux"
os.release(); // "6.17.8-arch1-1"
os.tmpdir(); // "/tmp"
os.uptime(); // 83085.43 (seconds)

// Returns {
//   uid: 1000,
//   gid: 1000,
//   username: "username",
//   homedir: "/home/username",
//   shell: "/bin/bash"
// }
os.userInfo();

os.constants.signals.SIGTERM; // 15
```

## Process

```js
const process = require("node:process");

process.argv; // CLI args to node

process.chdir("/tmp"); // Change the working directory
process.cwd(); // Returns current working directory
process.exit(1); // Exit with code 1

// Reads text from stdin, converts it to uppercase, and writes it back to
// stdout
process.stdin.on(
  "data",
  // Write an upper case string to output
  (chunk) => process.stdout.write(chunk.toString().toUpperCase())
);
process.stdin.on("end", () => console.log("Finished!"));
```

## Handling URLs

```js
const url = require('node:url');

const myURL =
  new URL('https://user:pass@sub.example.com:8080/p/a/t/h?query=string#hash');

myURL.host; // "sub.example.com:8080"
myURL.hostname; // "sub.example.com"
myURL.origin; // "https://sub.example.com:8080"
myURL.username; // "user"
myURL.password; // "pass"
myURL.port; // "8080"
myURL.protocol; // "https:"
```
