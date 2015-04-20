# Discourse::SSO::Rails

Gem provides simple integration with Discourse sso, see _Usage_

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'discourse-sso-rails'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install discourse-sso-rails

## Usage

```ruby
# initializers/discourse_sso.rb
DiscourseSSO::Config.configure do |config|
  config.secret = ENV['DISCOURSE_SSO_SECRET']
end

# app/controllers/sso_controller.rb
def authenticate
  sso = DiscourseSSO::Request.new(sso: params[:sso], sig: params[:sig])

  sso.user = {
    name: "Bruce Lee",
    username: "lbruce",
    email: "bruce_lee@gmail.com",
    external_id: "228",
  }

  redirect_to sso.callback_url
end
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

1. Fork it ( https://github.com/[my-github-username]/discourse-sso-rails/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
