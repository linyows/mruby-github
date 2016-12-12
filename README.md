mruby-github
============

The Github API Client for mruby.

[![Build Status](https://travis-ci.org/linyows/mruby-github.svg?branch=master)][travis]
[travis]: http://travis-ci.org/linyows/mruby-github

Mrbgems Installation
--------------------

- add conf.gem line to `build_config.rb`

```ruby
MRuby::Build.new do |conf|

    # ... (snip) ...

    conf.gem :github => 'linyows/mruby-github'
end
```

Example
-------

```ruby
client = Github::Client.new
client.org_teams('github')
```

Authors
-------

- [linyows][linyows]
[linyows]: https://github.com/linyows

License
-------

The MIT License (MIT)
