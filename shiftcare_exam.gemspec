Gem::Specification.new do |s|
  s.name        = "shiftcare_exam"
  s.version     = "1.0.0"
  s.summary     = "Shiftcare Exam"
  s.description = "Technical Exam"
  s.authors     = ["Analyn Cajocson"]
  s.email       = "analyncajocson@gmail.com"
  s.files       = Dir['Gemfile', '{lib,spec}/**/*', 'README*', 'clients.json']
  s.homepage    = "https://github.com/analyn-cajocson/shiftcare_exam"
  s.add_development_dependency "rspec", '~> 3.13'
end
