# mruby-github   [![Build Status](https://travis-ci.org/linyows/mruby-github.svg?branch=master)](https://travis-ci.org/linyows/mruby-github)
Example class
## install by mrbgems
- add conf.gem line to `build_config.rb`

```ruby
MRuby::Build.new do |conf|

    # ... (snip) ...

    conf.gem :github => 'linyows/mruby-github'
end
```
## example
```ruby
p Example.hi
#=> "hi!!"
t = Example.new "hello"
p t.hello
#=> "hello"
p t.bye
#=> "hello bye"
```

## License
under the MIT License:
- see LICENSE file
