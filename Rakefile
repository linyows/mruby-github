MRUBY_CONFIG=File.expand_path(ENV['MRUBY_CONFIG'] || 'build_config.rb')
MRUBY_VERSION=ENV['MRUBY_VERSION'] || 'master'

file :mruby do
  sh 'git clone --depth=1 git://github.com/mruby/mruby.git'
  Dir.chdir('./mruby') do
    sh "git fetch --tags && git checkout $(git rev-parse #{MRUBY_VERSION})"
  end if MRUBY_VERSION != 'master'
end

desc 'compile binary'
task :compile => :mruby do
  Dir.chdir('./mruby') do
    sh "MRUBY_CONFIG=#{MRUBY_CONFIG} rake all"
  end
end

desc 'test'
task :test => :mruby do
  Dir.chdir('./mruby') do
    sh "MRUBY_CONFIG=#{MRUBY_CONFIG} rake all test"
  end
end

desc 'cleanup'
task :clean do
  Dir.chdir('./mruby') do
    sh 'rake deep_clean'
  end if File.directory?('mruby')
end

task :default => :compile
