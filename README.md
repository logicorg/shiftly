## Shiftly

Factory shift methods collection

by [Ruby Logic](http://rubylogic.eu)

## Usage

There are available extensions for:

### Time class

```ruby
Time.now.to_factory_date
```
returns yesterday when it is before 6am and today otherwise

```ruby
Time.now.shift
```
returns shift number for datetime

```ruby
Time.now.shift_beg
```
returns shift beginning datetime for datetime

```ruby
Time.now.shift_end
```
returns shift end datetime for datetime
