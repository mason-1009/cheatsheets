# `faker`

> Faker is a Python package that generates fake data for you. Whether you need
> to bootstrap your database, create good-looking XML documents, fill-in your
> persistence to stress test it, or anonymize data taken from a production
> service, Faker is for you.

---

## Installation

Install `faker` using your favorite package manager:

```bash
pip install Faker
```

Import `faker` and instantiate it for use:

```python
from faker import Faker

fake = Faker()
fake.name()
```

## Providers

Data for `faker` comes from its providers, which attach fake generators
directly to the `Faker` instance.

### Address

```python
fake.address() # 'USNV Chavez FPO AP 92641'
fake.building_number() # '076'
fake.city() # 'New Veronicaborough'
fake.city_suffix() # 'town'
fake.country() # 'Faroe Islands'
fake.country_code() # 'IE'
fake.current_country() # 'United States'
fake.current_country_code() # 'US'
fake.postcode() # '33645'
fake.street_address() # '268 Owens Trafficway'
fake.street_name() # 'Daniel Shore'
fake.street_suffix() # 'Orchard'
```

### Automotive

```python
fake.license_plate() # '2J IC862'
fake.vin() # 'PFTT0RLG0KXD65330'
```

### Bank

```python
fake.aba() # '023074149'
fake.bank_country() # 'GB'
fake.bban() # 'HPYN47340783075802'
fake.iban() # 'GB47LLGI73081197577696'
```

### Barcode

```python
fake.ean() # '4753849882028'
fake.ean13() # '6139773150866'
fake.ean8() # '73226406'
fake.localized_ean() # '0814945029138'
fake.localized_ean13() # '0473294898286'
fake.localized_ean8() # '06457341'
```

### Color

```python
fake.color() # '#d86369'
fake.color_hsl() # '(39, 72, 66)'
fake.color_hsv() # '(177, 75, 74)'
fake.color_name() # 'MediumVioletRed'
fake.color_rgb() # '(102, 232, 117)'
fake.color_rgb_float() # '(0.2171416666666668, 0.10650000000000001, 0.71)'
fake.hex_color() # '#7ab737'
fake.rgb_color() # '57,40,92'
fake.rgb_css_color() # 'rgb(251,255,130)'
fake.safe_color_name() # 'gray'
fake.safe_hex_color() # '#dd8888'
```

### Company

```python
fake.bs() # 'transform leading-edge methodologies'
fake.catch_phrase() # 'Exclusive user-facing hardware'
fake.company() # 'Bass, Rivera and Shaw'
fake.company_suffix() # 'Ltd'
```

### Credit Card

```python
fake.credit_card_expire() # '07/27'
fake.credit_card_full() # 'Maestro Natalie Miller 501890204693 07/34 CVV: 068'
fake.credit_card_number() # '2269536882387470'
fake.credit_card_security_code() # '538'
```

### Currency

```python
fake.cryptocurrency() # '('AUR', 'Auroracoin')'
fake.cryptocurrency_code() # 'LTC'
fake.cryptocurrency_name() # 'Bitcoin'
fake.currency() # '('UZS', 'Uzbekistani soʻm')'
fake.currency_code() # 'ANG'
fake.currency_name() # 'Romanian leu'
fake.currency_symbol() # 'Fr'
fake.pricetag() # '$4.41'
```

### Date and Time

```python
fake.am_pm() # 'AM'
fake.century() # 'IV'
fake.date() # '1982-05-25'
fake.date_between() # '2014-05-30'
fake.date_between_dates() # '2026-02-07'
fake.date_object() # '1995-04-15'
fake.date_of_birth() # '1979-02-14'
fake.date_this_century() # '2022-01-11'
fake.date_this_decade() # '2025-02-24'
fake.date_this_month() # '2026-02-01'
fake.date_this_year() # '2026-01-25'
fake.date_time() # '2011-07-08 08:49:26.026001'
fake.date_time_ad() # '0152-03-15 03:16:47.650406'
fake.date_time_between() # '2023-06-22 22:02:12.602205'
fake.date_time_between_dates() # '2026-02-07 17:50:57'
fake.date_time_this_century() # '2020-02-23 04:19:41.943145'
fake.date_time_this_decade() # '2024-06-05 08:42:54.488322'
fake.date_time_this_month() # '2026-02-01 16:50:05.250970'
fake.date_time_this_year() # '2026-02-01 19:23:05.814230'
fake.day_of_month() # '30'
fake.day_of_week() # 'Friday'
fake.future_date() # '2026-02-20'
fake.future_datetime() # '2026-02-24 12:43:13.507081'
fake.iso8601() # '2019-02-03T14:19:33.958368'
fake.month() # '11'
fake.month_name() # 'July'
fake.past_date() # '2026-01-28'
fake.past_datetime() # '2026-01-28 03:52:45.138560'
fake.pytimezone() # 'Pacific/Funafuti'
fake.time() # '14:08:10'
fake.time_delta() # '0:00:00'
fake.time_object() # '08:44:18.412499'
fake.timezone() # 'Africa/Maseru'
fake.unix_time() # '88772848.74242276'
fake.year() # '1991'
```

### File Type

```python
fake.file_extension(category='text') # 'html'
fake.file_extension(category='audio') # 'mp3'
fake.file_extension(category='image') # 'jpeg'
fake.file_extension(category='office') # 'numbers'
fake.file_extension(category='video') # 'mov'

fake.file_name(category='text') # 'agree.txt'
fake.file_name(category='audio') # 'worry.flac'
fake.file_name(category='image') # 'include.png'
fake.file_name(category='office') # 'fish.odt'
fake.file_name(category='video') # 'today.webm'

fake.mime_type() 
```

### Geographical Coordinates

```python
fake.coordinate() # '38.783824'
fake.latitude() # '61.5514815'
fake.latlng() # '(Decimal('14.2232325'), Decimal('29.222466'))'
fake.local_latlng() # '('33.03699', '-117.29198', 'Encinitas', 'US', 'America/Los_Angeles')'
fake.location_on_land() # '('40.66482', '122.22833', 'Yingkou', 'CN', 'Asia/Shanghai')'
fake.longitude() # '21.313806'
```

### Internet

```python
fake.ascii_company_email() # 'athomas@proctor.org'
fake.ascii_email() # 'roblesjoseph@gmail.com'
fake.ascii_free_email() # 'robinpalmer@yahoo.com'
fake.ascii_safe_email() # 'cruznichole@example.com'
fake.company_email() # 'jnguyen@davis.com'
fake.dga() # 'gbjtlakdbubgsuwyqjajjhqnxeaoj.net'
fake.domain_name() # 'brown.info'
fake.domain_word() # 'medina'
fake.email() # 'christianfrazier@example.com'
fake.free_email() # 'taylor36@yahoo.com'
fake.free_email_domain() # 'hotmail.com'
fake.hostname() # 'srv-97.anderson.info'
fake.http_method() # 'CONNECT'
fake.http_status_code() # '415'
fake.iana_id() # '354022'
fake.image_url() # 'https://picsum.photos/510/232'
fake.ipv4() # '52.25.10.222'
fake.ipv4_network_class() # 'a'
fake.ipv4_private() # '10.43.232.141'
fake.ipv4_public() # '217.137.185.26'
fake.ipv6() # 'ad73:ab8b:9e4d:efcd:d4ea:503:f565:829a'
fake.mac_address() # '74:1d:22:de:0d:e7'
fake.nic_handle() # 'SN54599-FAKE'
fake.nic_handles() # '['ZN18-APOR']'
fake.port_number() # '41486'
fake.ripe_id() # 'ORG-RBI9428-RIPE'
fake.safe_domain_name() # 'example.net'
fake.safe_email() # 'meyersgregory@example.net'
fake.slug() # 'assume-which-way'
fake.tld() # 'com'
fake.uri() # 'https://www.huang.biz/categories/main/searchmain.htm'
fake.uri_extension() # '.html'
fake.uri_page() # 'search'
fake.uri_path() # 'wp-content'
fake.url() # 'http://www.jimenez-kelley.com/'
fake.user_name() # 'awhite'
```

### Job

```python
fake.job() # 'Computer games developer'
fake.job_female() # 'Therapist, music'
fake.job_male() # 'Newspaper journalist'
```

### Text

```python
# List of 10 fake words
fake.words(nb=10)

# Fake sentence with 10 words
fake.sentence(nb_words=10)

# Fake paragraph with 10 sentences
fake.paragraph(nb_sentences=10)

# Array of 10 paragraphs
fake.paragraphs(nb=10)
```

### Person

```python
fake.first_name() # 'John'
fake.first_name_female() # 'Chelsey'
fake.first_name_male() # 'Steven'
fake.first_name_nonbinary() # 'Sara'
fake.language_name() # 'Kuanyama'
fake.last_name() # 'James'
fake.last_name_female() # 'Blake'
fake.last_name_male() # 'Thompson'
fake.last_name_nonbinary() # 'Reeves'
fake.name() # 'Tony Meyer'
fake.name_female() # 'Victoria Tate'
fake.name_male() # 'Brent Ward'
fake.name_nonbinary() # 'Michael Dougherty Jr.'
fake.prefix() # 'Mrs.'
fake.prefix_female() # 'Mrs.'
fake.prefix_male() # 'Mr.'
fake.prefix_nonbinary() # 'Mx.'
fake.suffix() # 'Jr.'
fake.suffix_female() # 'DDS'
fake.suffix_male() # 'DVM'
fake.suffix_nonbinary() # 'II'
```

### Phone Number

```python
fake.country_calling_code() # '+353'
fake.phone_number() # '629-765-9888x9114'
```

### Miscellaneous

```python
fake.isbn10() # '1-4328-4029-0'
fake.isbn13() # '978-0-08-594921-0'

fake.doi() # '10.99577205/c2f0w15'

fake.emoji() # '👋'
fake.json() # '{...}'

fake.ssn() # '099-83-7038'
```
