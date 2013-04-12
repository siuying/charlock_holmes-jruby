# CharlockHolmes for JRuby

Character encoding detecting library for JRuby using [ICU4J](http://site.icu-project.org/).

## Requirements

- JRuby in 1.9 mode (or above)

## Usage

First you'll need to require it

```
require 'charlock_holmes'
```

## Encoding detection

```ruby
contents = File.read('test.xml')
detection = CharlockHolmes::EncodingDetector.detect(contents)
# => {:encoding => 'UTF-8', :confidence => 100}

# optionally there will be a :language key as well, but
# that's mostly only returned for legacy encodings like ISO-8859-1
```

NOTE: ```CharlockHolmes::EncodingDetector.detect``` will return nil if it was unable to find an encoding.

