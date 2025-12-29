# Greasemonkey

> *Greasemonkey* provides several methods in its API to enhance the power of
> user scripts.

---

## Preface

This guide refers to the *Greasemonkey* API, but it centers heavily around
practices in the *Tampermonkey* user script extension.

User scripts must begin with a commented section containing metadata and
enumerated permissions for the script:

```javascript
// ==UserScript==
// @name         ScriptName
// @namespace    http://tampermonkey.net/
// @version      2025-12-29
// @description  Does one thing then it does another thing!
// @author       My Name
// @match        https://*/*
// @icon         https://icons.duckduckgo.com/ip2/mywebsite.com.ico
// @grant        GM.registerMenuCommand
// @grant        GM.notification
// @grant        GM.setClipboard
// ==/UserScript==
```

### A Word About Match Patterns

*Tampermonkey* uses match patterns from *Google Chrome* (these are denoted with
the `@match` lines above. Documentation from *Google* about these match
patterns can be found [in Google
documentation](https://developer.chrome.com/docs/extensions/develop/concepts/match-patterns),
but the most useful rules are reproduced here:

- `https://*/*` or `https://*/` matches any HTTPS URL
- `https://*/foo*` matches any HTTPS URL for any domain whose path begins with
  `foo`
- `*://*.example.com/login` matches any HTTP/HTTPS URL whose domain name ends
  in `.example.com` and whose path is `/login`

**Note:** The `*` wild-card only matches HTTP and HTTPS when used for URL
schemes.

### Permissions

Permissions for a user script are marked with `@grant`. Access to API methods
are listed one-by-one using this scheme. For example, a script which needs to
use the `GM.openInTab(...)` and `GM.setValue(...)` methods needs to have the
following lines:

```javascript
// ==UserScript==
// ...
// @grant    GM.openInTab
// @grant    GM.setValue
// ...
// ==/UserScript==
```

**Note:** All scripts are given `GM.info` permissions by default.

### Injecting Your Script

The `@run-at` parameter is used to configure when a script should be injected
into a webpage:

- `document-end` (**default**) executes the user script after the main page is
  loaded but before images, style-sheets, and other resources have loaded.
- `document-start` executes the script before the document begins loading.
- `document-idle` executes the script after the page finishes loading, its
  resources (images and style-sheets) finish loading, and the page scripts have
  run.

**Note:** Use `document.readyState` to determine the status of a loading page.
It returns three possible strings:

- `"loading"`
- `"interactive"`
- `"complete"`

## Greasemonkey APIs

### `GM.info`

The `GM.info` variable contains information about the script:

```javascript
{
  "downloadMode": "native",
  "isIncognito": false,
  "relaxedCsp": "auto",
  "sandboxMode": "raw",
  "script": {
    "antifeatures": {},
    "author": "My Name",
    "blockers": [],
    "connects": [],
    "copyright": null,
    "description_i18n": {},
    "description": "Does one thing then it does another thing!",
    "downloadURL": null,
    "excludes": [],
    "fileURL": null,
    "grant": [
      "GM.registerMenuCommand",
      "GM.notification",
      "GM.setClipboard"
    ],
    "header": "// ==UserScript==\n ... ==/UserScript==",
    "homepage": null,
    "icon": null,
    "icon64": null,
    "includes": [],
    "lastModified": 1767037341366,
    "matches": [
      "https://*/*"
    ],
    "name_i18n": {},
    "name": "ScriptName",
    "namespace": "http://tampermonkey.net/",
    "options": {
      "check_for_updates": true,
      "user_modified": 1767037341368,
      "comment": null,
      "compatopts_for_requires": true,
      "compat_wrappedjsobject": false,
      "compat_metadata": false,
      "compat_foreach": false,
      "compat_powerful_this": false,
      "sandbox": null,
      "noframes": null,
      "unwrap": null,
      "run_at": "document-idle",
      "run_in": [],
      "tags": [],
      "override": {
        "use_includes": [],
        "orig_includes": [],
        "merge_includes": true,
        "use_matches": [],
        "orig_matches": [
          "https://*/*"
        ],
        "merge_matches": true,
        "use_excludes": [],
        "orig_excludes": [],
        "merge_excludes": true,
        "use_connects": [],
        "orig_connects": [],
        "merge_connects": true,
        "use_blockers": [],
        "orig_run_at": "document-idle",
        "orig_run_in": [],
        "orig_noframes": null,
        "orig_tags": []
      }
    },
    "position": 5,
    "resources": [],
    "run-at": "document-idle",
    "run-in": [],
    "supportURL": null,
    "unwrap": null,
    "updateURL": null,
    "version": "2025-12-29",
    "webRequest": null
  },
  "scriptHandler": "Tampermonkey",
  "scriptMetaStr": "// ==UserScript==\n...==/UserScript==",
  "scriptUpdateURL": null,
  "scriptWillUpdate": false,
  "userAgentData": {
    "brands": [
      {
        "brand": "Firefox",
        "version": "146.0.1"
      }
    ],
    "mobile": false,
    "platform": "Linux",
    "bitness": "64",
    "architecture": "x86"
  },
  "version": "5.4.1"
}
```

### `GM.setValue` and `GM.getValue`

Set and retrieve values to be stored in the browser across page loads and
origins. Allowed data types are strings, booleans, and integers:

```javascript
GM.getValue('key_name', 'default'); // Returns 'default'
GM.setValue('key_name', 'value');
GM.getValue('key_name'); // Returns 'value'
```

### `GM.notification`

Opens a notification dialog for the user with the browser and operating
system's notification mechanism:

```javascript
// title, image, and onclick are optional
// onclick is a callback executed when the notification window is clicked
GM.notification(text, title, image, onclick);

// GM.notification can accept an options object as well
// ondone executes when a notification window closes
GM.notification({
  text: 'Body text',
  title: 'Title text',
  onclick: () => console.log('Clicked!'),
  ondone: () => console.log('Done!')
})
```

### `GM.openInTab`

Opens a URL in a new tab:

```javascript
GM.openInTab('https://www.example.com/'); // Opens a URL in a new tab
GM.openInTab('https://www.example.com/', true); // Opens in the background
```

### `GM.setClipboard`

Writes to the system clipboard:

```javascript
GM.setClipboard('Testing testing 1.2.3...');
```

### `GM.xmlHttpRequest`

Similar to the standard `xmlHttpRequest` method but skips the same-origin
policy:

```javascript
GM.xmlHttpRequest({
  method: 'POST',
  url: 'http://www.example.net/login',
  data: 'username=johndoe&password=xyz123',
  headers: {
    'Content-Type': 'application/x-www-form-urlencoded'
  },
  onload: function(response) {
    if (response.responseText.indexOf('Logged in as') > -1) {
      location.href = 'http://www.example.net/dashboard';
    }
  }
});
```

### `GM.registerMenuCommand`

When a user script is loaded onto a page, it can create a visible drop-down
menu to enable better interactivity:

```javascript
// Registers a menu item that alerts when clicked
GM.registerMenuCommand(
  'Hello, world (simple)',
  () => alert('Hello, world!')
);

// Adds an access key for easier command selection
GM.registerMenuCommand(
  'Help',
  () => alert('I cannot help'),
  'h'
);
```

### `unsafeWindow`

This is provided by default and needs no permissions. The `unsafeWindow`
identifier is a direct alias for the `window` scope of the current page. It can
be used to access variables from the webpage.

**Warning:** The use of `unsafeWindow` can introduce security vulnerabilities
to your user script. Malicious websites can hijack the user script if they
anticipate it being loaded. Use this feature with extreme care.
