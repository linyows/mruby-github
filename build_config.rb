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
  toolchain :clang

  conf.enable_bintest
  conf.enable_debug
  conf.enable_test

  gem_config(conf)
end

MRuby::Build.new('x86_64-pc-linux-gnu') do |conf|
  toolchain :gcc

  gem_config(conf)
end

MRuby::CrossBuild.new('x86_64-apple-darwin14') do |conf|
  toolchain :clang

  [conf.cc, conf.linker].each do |cc|
    cc.command = 'x86_64-apple-darwin14-clang'
  end

  conf.cxx.command      = 'x86_64-apple-darwin14-clang++'
  conf.archiver.command = 'x86_64-apple-darwin14-ar'

  conf.build_target     = 'x86_64-pc-linux-gnu'
  conf.host_target      = 'x86_64-apple-darwin14'

  gem_config(conf)
end
