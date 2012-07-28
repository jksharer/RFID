# -*- encoding: utf-8 -*-
require File.expand_path('../lib/RFID/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Todd Johnston"]
  gem.email         = ["tjortho@msn.com"]
  gem.description   = %q{RFID is a thin wrapper for Ruby that provides access to the 'libnfc' C library for use with RFID devices.  Please visit 'libnfc.org' for more information about the library and its methods.}
  gem.summary       = %q{A Ruby wrapper for using the libnfc RFID library}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "RFID"
  gem.require_paths = ["lib"]
  gem.version       = RFID::VERSION

  gem.add_dependency "ffi", "~> 1.1.1"
end
