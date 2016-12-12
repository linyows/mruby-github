def gem_config(conf)
  conf.gembox 'default'
  conf.gem :github => 'iij/mruby-env'
  conf.gem :github => 'luisbebop/mruby-polarssl'
  conf.gem :github => 'matsumoto-r/mruby-httprequest'
  conf.gem :github => 'mattn/mruby-json'
  conf.gem :github => 'mattn/mruby-base64'
  conf.gem File.expand_path(File.dirname(__FILE__))
end

MRuby::Build.new do |conf|
  toolchain :gcc
  gem_config(conf)
end
