# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'html2mail/version'

Gem::Specification.new do |spec|
  spec.name          = "html2mail"
  spec.version       = Html2mail::VERSION
  spec.authors       = ["Egor Vakhromtsev"]
  spec.email         = ["e.vakhromtsev@gmail.com"]

  spec.summary       = %q{html to mail converter}
  spec.description   = %q{Console tool which generates html/eml stuff for your newsletters from html-files (support images in separate files)}
  spec.homepage      = "https://github.com/zuf/html2mail"
  spec.license       = "MIT"

  # # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # # delete this section to allow pushing this gem to any host.
  # if spec.respond_to?(:metadata)
  #   spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  # else
  #   raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  # end

  spec.required_ruby_version = '>= 1.9.1'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "bin"
  spec.executables   = "html2mail" #spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "actionmailer", "~> 4.2", '<= 4.2.5'
  spec.add_dependency "nokogiri", "~> 1.6"
  spec.add_dependency "premailer", "~> 1.8"
  spec.add_dependency "gli", "~> 2.13"

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.8"
  spec.add_development_dependency "simplecov", "~> 0.11"
end
