[![Build Status](https://travis-ci.org/denkungsart/meta_information.svg?branch=master)](https://travis-ci.org/denkungsart/meta_information)

# MetaInformation
This allows to save meta information for models.
This is mainly useful for lengthy API responses, which you don't want to save along with the rest of your model (eg. for performance concerns).

## Usage
The plugin adds a `meta_information`-method to all activerecord classes.

```ruby
class Video < ApplicationRecord
  meta_information :transcoder_response
end
```

This allows you to do:

```ruby
video.transcoder_response = { "job_id" => "XXX" }
video.transcoder_response # { "job_id" => "XXX", ... }
```

The information is serialized as JSON.

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
