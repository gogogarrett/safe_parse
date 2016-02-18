# SafeParse

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/safe_parse`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'safe_parse'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install safe_parse

## Usage

Parsing a json string safely.

```ruby
irb> json_string = JSON.generate({abc: 123})
=> "{\"abc\":123}"
irb> SafeParse.call(json_string)
=> {"abc"=>123}
```

Parsing an invalid json string will default to `{}`.

```ruby
irb> invalid_json_string = "abc123"
=> "abc123"
irb> SafeParse.call(invalid_json_string)
=> {}
```

SafeParse can take a default to return if the json parsing fails.

```ruby
irb> SafeParse.call(invalid_json_string, {abc: 123})
=> {:abc=>123}
```

Safe parse can also take a ruby hash and it correctly.

```ruby
irb> SafeParse.call({ruby: "hash"})
=> {:ruby=>"hash"}
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/gogogarrett/safe_parse. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

