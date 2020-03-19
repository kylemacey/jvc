# JVC

JVC is a neat way to set up mocked API fixtures with VCR.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'jvc'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install jvc

## Usage

Define a new fixture...

```ruby
JVC.fixture(:repository) do
  default do
    Octokit.repo("rails/rails")
  end

  trait(:personal) do
    Octokit.repo("kylemacey/repo-contrib-graph")
  end
end
```

Use it with...

```ruby
repo = JVC::Fixture[:repository]
```

Use a specific `trait` with...

```ruby
repo = JVC::Fixture[:repository, :personal]
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/kylemacey/jvc. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/kylemacey/jvc/blob/master/CODE_OF_CONDUCT.md).


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the JVC project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/kylemacey/jvc/blob/master/CODE_OF_CONDUCT.md).
