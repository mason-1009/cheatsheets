# Faker

> Generate massive amounts of fake (but realistic) data for testing and
> development.

---

## Installation

Install `@faker-js/faker` using your favorite package manager:

```bash
npm add @faker-js/faker
```

Import `@faker-js/faker` to use:

```javascript
// cjs-style import
const { faker } = require('@faker-js/faker');

// esm-style import
import { faker } from '@faker-js/faker';
```

## Modules

### Animals

Generate strings referring to random species of animals:

```javascript
faker.animal.dog(); // "Segugio dell'Appennino"
faker.animal.cat(); // 'Manx'
faker.animal.snake(); // 'Eastern mud snake'
faker.animal.bear(); // 'Spectacled bear'
faker.animal.lion(); // 'Masai Lion'
faker.animal.cetacean(); // 'Chilean Dolphin'
faker.animal.horse(); // 'Holsteiner Horse'
faker.animal.bird(); // 'Bean Goose'
faker.animal.cow(); // 'Hays Converter'
faker.animal.fish(); // 'Pond loach'
faker.animal.crocodilia(); // 'Spectacled Caiman'
faker.animal.insect(); // 'Scale parasitoid'
faker.animal.rabbit(); // 'Tan'
faker.animal.rodent(); // 'Plains viscacha'
faker.animal.petName(); // 'Lucy'
```

### Books

Generate random entries related to books:

```javascript
faker.book.author(); // 'Aldous Huxley'
faker.book.format(); // 'Audiobook'
faker.book.genre(); // 'Religion'
faker.book.publisher(); // 'Churchill Livingstone'
faker.book.series(); // 'The Foundation Series'
faker.book.title(); // 'Absalom, Absalom!'
```

### Colors

Generate random but valid colors:

```javascript
faker.color.human(); // 'red'
faker.color.space(); // 'HSLA'
faker.color.cssSupportedFunction(); // 'rgb'
faker.color.cssSupportedSpace(); // 'a98-rgb'
faker.color.rgb(); // '#7b9e05'
faker.color.cmyk(); // [ 0.67, 0.35, 0.28, 0.52 ]
faker.color.hsl(); // [ 145, 0.44, 0.71 ]
faker.color.hwb(); // [ 166, 0.22, 0.47 ]
faker.color.lab(); // [ 0.554941, 85.8714, -44.4841 ]
faker.color.lch(); // [ 0.982679, 134.2, 64.9 ]
faker.color.colorByCSSColorSpace(); // [ 0.4037, 0.3384, 0.7703 ]
```

### Commerce

Generate product names and commerce-related entries:

```javascript
faker.commerce.department(); // 'Health'
faker.commerce.productName(); // 'Recycled Aluminum Chicken'
faker.commerce.price(); // '406.15'
faker.commerce.productAdjective(); // 'Fantastic'
faker.commerce.productMaterial(); // 'Aluminum'
faker.commerce.product(); // 'Ball'
faker.commerce.productDescription(); // 'The Networked ... design'
faker.commerce.isbn(); // '978-0-640-41864-9'
```

### Company

Generate entries related to companies or corporations:

```javascript
faker.company.name(); // 'Funk - Monahan'
faker.company.catchPhrase(); // 'Exclusive neutral instruction set'
faker.company.buzzPhrase(); // 'benchmark turn-key e-commerce'
faker.company.catchPhraseAdjective(); // 'Diverse'
faker.company.catchPhraseDescriptor(); // 'incremental'
faker.company.catchPhraseNoun(); // 'core'
faker.company.buzzAdjective(); // 'distributed'
faker.company.buzzVerb(); // 'gamify'
faker.company.buzzNoun(); // 'large language models'
```

### Database

Produce simulated data related to database systems:

```javascript
faker.database.column(); // 'email'
faker.database.type(); // 'real'
faker.database.collation(); // 'ascii_general_ci'
faker.database.engine(); // 'MEMORY'
faker.database.mongodbObjectId(); // '0c514090fbc1edcae00c0e37'
```

### Date

Quickly generate dates from the past or the future:

```javascript
faker.date.month(); // 'June'
faker.date.weekday(); // 'Saturday'
faker.date.timeZone(); // 'America/Menominee'
faker.date.anytime(); // 2026-01-02T11:01:13.551Z
faker.date.past(); // 2025-08-13T22:49:07.427Z
faker.date.future(); // 2026-01-25T06:54:18.901Z
faker.date.recent(); // 2025-12-20T02:40:51.814Z
faker.date.soon(); // 2025-12-21T20:33:57.130Z
faker.date.birthdate(); // 1959-06-10T11:50:02.065Z
```

### Finance

Produce fake account numbers, names, credit card details, and amounts of money:

```javascript
faker.finance.accountNumber(); // '04231683'
faker.finance.accountName(); // 'Investment Account'
faker.finance.routingNumber(); // '371282117'
faker.finance.amount(); // '299.99'
faker.finance.transactionType(); // 'payment'
faker.finance.currency(); // Object with name, code, symbol, and numericCode
faker.finance.currencyCode(); // 'MVR'
faker.finance.currencyName(); // 'Forint'
faker.finance.currencySymbol(); // '₮'
faker.finance.currencyNumericCode(); // '292'
faker.finance.bitcoinAddress(); // 'bc1pd48s2jkqagwuh...6kq7yljxmzqz'
faker.finance.litecoinAddress(); // '3jRevVFmCkbBq98R4qjqaQPmQMgDv'
faker.finance.creditCardNumber(); // '6514-0577-2908-7771'
faker.finance.creditCardCVV(); // '523'
faker.finance.creditCardIssuer(); // 'discover'
faker.finance.pin(); // '1971'
faker.finance.ethereumAddress(); // '0x6b7243238c9cde6c3ff53a28f9faf5e36f91efe8'
faker.finance.iban(); // 'GB08JXQV30857327520099'
faker.finance.bic(); // 'PHAHSDSVXXX'
faker.finance.transactionDescription(); // 'You made a invoice ... ***8697.'
```

### Food

Generate food-related data, such as ingredients, dishes, and descriptions of
food items:

```javascript
faker.food.adjective(); // 'tangy'
faker.food.description(); // 'A heartwarming Mexican soup ... spices.'
faker.food.dish(); // 'Pho'
faker.food.ethnicCategory(); // 'Cypriot'
faker.food.fruit(); // 'custard apples daikon'
faker.food.ingredient(); // 'brussels sprouts'
faker.food.meat(); // 'ostrich'
faker.food.spice(); // 'chilli pepper'
faker.food.vegetable(); // 'sweet potato'
```

### Git

Generate fake `git` data, such as commit hashes, dates, messages, and branch
names:

```javascript
faker.git.branch(); // 'feed-quantify'
faker.git.commitEntry();
// 'commit bb764bcdd2ada6cdaa2fd5acf0edca83e507cf6e\r\n' +
// 'Author: Michaela.Moen <Michaela_Moen19@gmail.com>\r\n' +
// 'Date: Sat Dec 20 01:06:34 2025 -0300\r\n' +
// '\r\n' +
// '    bypass primary microchip\r\n'
faker.git.commitMessage(); // 'connect auxiliary panel'
faker.git.commitDate(); // 'Fri Dec 19 23:51:43 2025 +0500'
faker.git.commitSha(); // '38fbfcfdd00f65c9dcbad18a7fdb3ba63eff194e'
```

### Hacker

Generate hacking/computing-related words and phrases:

```javascript
faker.hacker.abbreviation(); // 'USB'
faker.hacker.adjective(); // 'neural'
faker.hacker.noun(); // 'port'
faker.hacker.verb(); // 'navigate'
faker.hacker.ingverb(); // 'synthesizing'
faker.hacker.phrase(); // "You can't bypass the bus ... JBOD protocol!"
```

### Image

Generate random URLs pointing to images:

```javascript
faker.image.avatar(); // 'https://avatars.githubusercontent.com/u/66592820'
faker.image.avatarGitHub(); // 'https://avatars.githubusercontent.com/u/...'
faker.image.personPortrait(); // 'https://cdn.jsdelivr.net/gh/.../512/72.jpg'
faker.image.url(); // 'https://picsum.photos/seed/BBihmWr/1868/1068'
faker.image.urlPicsumPhotos(); // 'https://picsum.photos/...&blur=1'
faker.image.dataUri(); // 'data:image/svg+xml;charset=UTF-8,%...%2Fsvg%3E'
```

### Internet

Generate internet terms, such as URLs, domain names, user agents, usernames,
email addresses, and passwords:

```javascript
faker.internet.email(); // 'Mireille.Wyman49@gmail.com'
faker.internet.exampleEmail(); // 'Royal_Okuneva40@example.net'
faker.internet.username(); // 'Meagan.Bashirian'
faker.internet.displayName(); // 'Anais83'
faker.internet.protocol(); // 'https'
faker.internet.httpMethod(); // 'PATCH'
faker.internet.httpStatusCode(); // 305
faker.internet.url(); // 'https://variable-retention.org'
faker.internet.domainName(); // 'faint-translation.com'
faker.internet.domainSuffix(); // 'info'
faker.internet.domainWord(); // 'tense-punctuation'
faker.internet.ip(); // '228.34.145.235'
faker.internet.ipv4(); // '226.193.5.206'
faker.internet.ipv6(); // '5c6e:a8e5:c163:cfa6:7f1e:7932:a1ff:df85'
faker.internet.port(); // 18666
faker.internet.userAgent(); // 'Mozilla/5.0...4.60.94'
faker.internet.mac(); // '8f:c8:08:78:a4:8a'
faker.internet.password(); // 'AmX8vwxXeOSQWRN'
faker.internet.emoji(); // '💊'
faker.internet.jwtAlgorithm(); // 'ES256'
faker.internet.jwt(); // 'eyJhbGciOiJCIsInR5cCI6IkpXVCJ9...4nvHXZBhU3MF1PHu'
```

### Location

Generate fake addresses and locations:

```javascript
faker.location.zipCode(); // '55069'
faker.location.city(); // 'Fort Carmel'
faker.location.buildingNumber(); // '1029'
faker.location.street(); // 'Jubilee Close'
faker.location.streetAddress(); // '265 The Limes'
faker.location.secondaryAddress(); // 'Apt. 489'
faker.location.county(); // 'Highlands and Islands'
faker.location.country(); // 'Wallis and Futuna'
faker.location.continent(); // 'Europe'
faker.location.countryCode(); // 'PM'
faker.location.state(); // 'Delaware'
faker.location.direction(); // 'North'
faker.location.cardinalDirection(); // 'South'
faker.location.ordinalDirection(); // 'Southeast'
faker.location.timeZone(); // 'Asia/Kathmandu'
faker.location.language(); // { name: 'Nepali', alpha2: 'ne', alpha3: 'nep' }
faker.location.latitude(); // -67.2189
faker.location.longitude(); // 119.7647
faker.location.nearbyGPSCoordinate(); // [ -77.9684, -147.8632 ]
```

### Lorem

Generate bodies of "Lorem Ipsum" style text (useful for filling out paragraphs
in blogs):

```javascript
faker.lorem.word(); // 'magni'
faker.lorem.words(); // 'culpo benigne vespillo'
faker.lorem.sentence(); // 'Benevolentia apud capio coma ... deduco.'
faker.lorem.slug(); // 'maxime-comptus-defluo'
faker.lorem.sentences(); // 'Fugiat ... voluptatum amaritudo.'
faker.lorem.paragraph(); // 'Ars volup ... thymbra degusto possimus omnis.'
faker.lorem.paragraphs(); // 'Cohors\n...nemo vel desidero.'
faker.lorem.lines(); // 'Verto amicitia.\n...Ex cinis utilis voluptatem.'
```

### Music

Generate fake music-related data, such as albums, artists, genres, and song
names:

```javascript
faker.music.album(); // 'Sin Bandera'
faker.music.artist(); // 'Shinedown'
faker.music.genre(); // 'Minimalism'
faker.music.songName(); // "Stormy Weather (Keeps Rainin' All the Time)"
```

### Number

Generate different kinds of random numbers:

```javascript
faker.number.int(); // 2010081717113743
faker.number.float(); // 0.7583837440860757
faker.number.binary(); // '0'
faker.number.octal(); // '1'
faker.number.hex(); // '6'
faker.number.bigInt(); // 766711827865634n
faker.number.romanNumeral(); // 'MDCCCXCVII'
```

### Person

Generate fake personal data such as names, prefixes, suffixes, job titles,
astrological signs, biographies, and gender:

```javascript
faker.person.firstName(); // 'Elian'
faker.person.lastName(); // 'Padberg'
faker.person.middleName(); // 'August'
faker.person.fullName(); // 'Roberta Ritchie'
faker.person.gender(); // 'Female to male transgender man'
faker.person.sex(); // 'female'
faker.person.sexType(); // 'female'
faker.person.bio(); // 'apricot devotee, activist 🇧🇮'
faker.person.prefix(); // 'Dr.'
faker.person.suffix(); // 'Jr.'
faker.person.jobTitle(); // 'Global Quality Planner'
faker.person.jobDescriptor(); // 'Senior'
faker.person.jobArea(); // 'Response'
faker.person.jobType(); // 'Specialist'
faker.person.zodiacSign(); // 'Pisces'
```

### Phone

Generate phone-related data such as numbers and IMEI strings:

```javascript
faker.phone.number(); // '(752) 972-3636 x506'
faker.phone.imei(); // '71-705005-428595-1'
```

### Science

Generate science related terms, like chemical elements and units:

```javascript
faker.science.chemicalElement();
// { symbol: 'Pm', name: 'Promethium', atomicNumber: 61 }
faker.science.unit(); // { name: 'mole', symbol: 'mol' }
```

### String

Generate random strings in different formats:

```javascript
faker.string.alpha(); // 'h'
faker.string.alphanumeric(); // 'T'
faker.string.binary(); // '0b0'
faker.string.octal(); // '0o5'
faker.string.hexadecimal(); // '0xF'
faker.string.numeric(); // '1'
faker.string.sample(); // 'KAhWQor&M@'
faker.string.uuid(); // '32c04c20-8b38-4062-8aaa-aff526560155'
faker.string.ulid(); // '01KCYVC6VCAMP6ECBCNKFX767T'
faker.string.nanoid(); // 'lDAJA3QegFNVuQjD8vOiL'
faker.string.symbol(); // '+'
```

### System

Generate computer system property data, such as file paths, file names, `cron`
schedules, and semantic versioning strings:

```javascript
faker.system.fileName(); // 'creature_why_mount.bin'
faker.system.commonFileName(); // 'why_why.mp4v'
faker.system.mimeType(); // 'audio/mpeg'
faker.system.commonFileType(); // 'audio'
faker.system.commonFileExt(); // 'mp3'
faker.system.fileType(); // 'text'
faker.system.fileExt(); // 'pot'
faker.system.directoryPath(); // '/var/yp'
faker.system.filePath(); // '/System/brr_likewise_oh.otf'
faker.system.semver(); // '6.5.0'
faker.system.networkInterface(); // 'enx29be0c412813'
faker.system.cron(); // '25 6 * * ?'
```

### Vehicle

Generate data related to vehicles, such as car makes and models, fuels, colors,
and VIN numbers:

```javascript
faker.vehicle.vehicle(); // 'Porsche Silverado'
faker.vehicle.manufacturer(); // 'Kia'
faker.vehicle.model(); // 'Jetta'
faker.vehicle.type(); // 'Cargo Van'
faker.vehicle.fuel(); // 'Gasoline'
faker.vehicle.vin(); // 'WU7D1WTTZKPN37546'
faker.vehicle.color(); // 'mint green'
faker.vehicle.vrm(); // 'TW52GPY'
faker.vehicle.bicycle(); // 'Recumbent Bicycle'
```

### Word

Generate random words based on a chosen part of speech:

```javascript
faker.word.adjective(); // 'knotty'
faker.word.adverb(); // 'softly'
faker.word.conjunction(); // 'while'
faker.word.interjection(); // 'phooey'
faker.word.noun(); // 'porter'
faker.word.preposition(); // 'without'
faker.word.verb(); // 'quintuple'
faker.word.sample(); // 'glimmer'
faker.word.words(); // 'below'
faker.word.words(5); // 'dulcimer gah ack hexagon opposite'
```

**Note:** Methods can accept an integer count to produce a certain number of
examples.
