# Differin

#### IMPORTANT: This GEM is created as test task and not ready for production yet.

**Differin** this is gem for showing diff between files. Differin has multiple Engines to process data and Renderers to show the results.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'differin', '~> 0.1.0'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install differin

## Usage

~~~ruby
require 'differin'

diff = Differin::Diff.new('examples/file1.txt', 'examples/file2.txt')
diff.process

# or

Differin.diff('examples/file1.txt', 'examples/file2.txt')
~~~

Result of these commands:
~~~ruby
[
  {
    status: :modified,
    lines: [1, 1],
    values: ['Some', 'Another']
  } ...
]
~~~

### Renderers

You can choose the Renderer for rendering processed data.

~~~ruby
diff = Differin::Diff.new('examples/file1.txt', 'examples/file2.txt')

# These commands run processing and render data as Array or JSON
diff.process(renderer: Differin::Renderers::Array)
diff.process(renderer: Differin::Renderers::JSON)

# This command just re-render already processed data
diff.render(Differin::Renderers::Array)

# Short version
Differin.diff('examples/file1.txt', 'examples/file2.txt', renderer: Differin::Renderers::JSON)
~~~

#### Available renderers

- `Differin::Renderers::Array`
- `Differin::Renderers::JSON`
- `Differin::Renderers::Hash`
- More renderers in section **Extensions**

### Engines

You can choose the Engine for file processing.

~~~ruby
diff = Differin::Diff.new('examples/file1.txt', 'examples/file2.txt')

diff.process(engine: Differin::Engines::LCS)
diff.process(engine: Differin::Engines::LCS, renderer: Differin::Renderers::Hash)
~~~

#### Available engines

- `Differin::Engines::LCS`
- More engines in section **Extensions**

## Extensions

**Differin is flexible.** You can easy create or just connect new **renderers** and **engines**.

#### Available renderers

- [Differin::Renderers::Text](http://github.com/MrEmelianenko/differin-renderers-text)

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/differin. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

