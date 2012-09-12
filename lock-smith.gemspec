#encoding: UTF-8
Gem::Specification.new do |s|
  s.name          = "lock-smith"
  s.email         = "ryan@heroku.com"
  s.version       = "0.0.1"
  s.date          = "2012-09-12"
  s.description   = "Locking toolkit for a variety of data stores."
  s.summary       = "Locking is hard. Write it once."
  s.authors       = ["Ryan Smith (♠ ace hacker)"]
  s.homepage      = "http://github.com/ryandotsmith/lock-smith"
  s.license       = "MIT"
  s.files         = Dir.glob("lib/**/*") << "readme.md"
  s.require_path  = "lib"
end
