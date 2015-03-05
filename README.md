# (environ)ment

(environ)ment adds methods for asking what's the value of `ENV['RACK_ENV']`.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'ment'
```

And then execute:

```bash
$ bundle
```

Or install it yourself as:

```bash
$ gem install ment
```

## Usage

Ment adds the following methods to your Rack app:

* `::environment`/`#environment`: returns the value of `ENV['RACK_ENV']`
* `::development?`/`#development?`: returns `true` if `ENV['RACK_ENV'] == 'development'`
* `::production?`/`#production?`: returns `true` if `ENV['RACK_ENV'] == 'production'`
* `::test?`/`#test?`: returns `true` if `ENV['RACK_ENV'] == 'test'`

### Using Ment directly

```ruby
require 'ment'

proc = Proc.new do
  if Ment.production?
    [200, {}, ['This is production']]
  else
    [200, {}, ["The current environment is #{Ment.environment}"]]
  end
end

run proc
```

### Using [Rack](https://github.com/rack/rack)

```ruby
require 'ment'

class App
  include Ment

  def call(env)
    if production?
      [200, {}, ['This is production']]
    else
      [200, {}, ["The current environment is #{environment}"]]
    end
  end
end

run App.new
```

### Using [Cuba](https://github.com/soveran/cuba)

```ruby
require 'cuba'
require 'ment'

Cuba.plugin Ment

Cuba.define do
  on production? do
    res.write 'This is production'
  end

  on root do
    res.write "The current environment is #{environment}"
  end
end
```

### Using [Hobbit](https://github.com/patriciomacadden/hobbit)

```ruby
require 'hobbit'
require 'ment'

class App < Hobbit::Base
  include Ment

  if production?
    get '/' do
      'This is production'
    end
  end

  get '/' do
    "The current environment is #{environment}"
  end
end
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## License

See the [LICENSE](https://github.com/patriciomacadden/ment/blob/master/LICENSE).
