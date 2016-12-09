MRuby::Gem::Specification.new('mruby-github') do |spec|
  spec.license = 'MIT'
  spec.authors = 'linyows'
  spec.summary = 'mruby-github'

  spec.add_dependency 'mruby-polarssl'
  spec.add_dependency 'mruby-httprequest'
  spec.add_dependency 'mruby-json'
  spec.add_dependency 'mruby-base64'
end
