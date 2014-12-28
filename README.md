## Shiftly

[![Gem Version](https://badge.fury.io/rb/shiftly.svg)](http://badge.fury.io/rb/shiftly)
[![Code Climate](https://codeclimate.com/github/logicorg/shiftly/badges/gpa.svg)](https://codeclimate.com/github/logicorg/shiftly)

Factory shift methods collection by [RubyLogic, PL](http://rubylogic.eu)

## Usage

Add it to your Gemfile with:

```ruby
gem 'shiftly'
```

Run the bundle command to install it.

Run generator if needed with:

```console
rails generate shiftly:config
```

Then you have access to the following extensions.

### Time class exts

```ruby
Time.now.to_factory_date
# returns yesterday when it is before 6am and today otherwise

Time.now.shift
# returns shift number for datetime

Time.now.shift_beg
# returns shift beginning datetime

Time.now.shift_end
# returns shift end datetime
```

### Fixnum class exts

```ruby
1.next_shift
# returns next shift for 1, 2 or 3

1.prev_shift
# returns previous shift for 1, 2 or 3
```