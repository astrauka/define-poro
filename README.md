# Define Poro

Plain Old Ruby Object class builder from provided attribute list and block.

## Rationale

I have been using Struct.new to dynamically create ruby objects that base their identity
on functionality and not on values.

```
RegisterUser = Struct.new(:user, :params) do
  # logic for registering user
end
```

Then I looked what a Struct is: http://en.wikipedia.org/wiki/Struct_%28C_programming_language%29

From ruby side http://www.ruby-doc.org/core-2.2.0/Struct.html

So it is an object that acts like container for data. It implements `Enumerable`.
But `RegisterUser` is not a data container, neither enumerable. So what is it?

I would say PORO (plain old ruby object).

It should be described as:

```
RegisterUser
  attr_reader :user, :params

  def initialize(user, params)
    @user, @params = user, params
  end

  # logic for registering user
end
```

Ruby guys are lazy so we would like to type something shorter - that's provided by DefinePoro:

```
RegisterUser = DefinePoro::Define.new(:user, :params) do
  # logic for registering user
end
```

The `DefinePoro::Define` implementation is easy and performant ruby code.

## Should you use it?

Yes - if you are lazy to type initializers.

No - if you think that dynamic class definition could be harmful.
And I believe that in some cases it could.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'define-poro'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install define-poro

## Usage

Instead of

```
RegisterUser
  attr_reader :user, :params

  def initialize(user, params)
    @user, @params = user, params
  end

  # logic for registering user
end
```

Define you class via

```
RegisterUser = DefinePoro::Define.new(:user, :params) do
  # logic for registering user
end
```

## Contributing

1. Fork it ( https://github.com/astrauka/define-poro/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Ensure that you have written specs (rspec)
5. Push to the branch (`git push origin my-new-feature`)
6. Create a new Pull Request
