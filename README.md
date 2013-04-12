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

## String monkey patch

Alternatively, you can just use the detect_encoding method on the String class

```
require 'charlock_holmes/string'

contents = File.read('test.xml')

detection = contents.detect_encoding
# => {:encoding => 'UTF-8', :confidence => 100}

# this will detect and set the encoding of `contents`, then return self
contents.detect_encoding!
```

## Transcoding

Being able to detect the encoding of some arbitrary content is nice, but what you probably want is to be able to transcode that content into an encoding your application is using.

```

content = File.read('test2.txt')
detection = CharlockHolmes::EncodingDetector.detect(content)
utf8_encoded_content = CharlockHolmes::Converter.convert content, detection[:encoding], 'UTF-8'
```

The first parameter is the content to transcode, the second is the source encoding (the encoding the content is assumed to be in), and the third parameter is the destination encoding.

## Installing

```
gem install charlock_holmes-jruby
```

## Copyright

Copyright 2013 Francis Chong

Licensed under the MIT License.