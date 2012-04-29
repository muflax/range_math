Gem::Specification.new do |s|
  s.name = "range_math"
  s.version = "0.3.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["muflax"]
  s.description = "use ranges in math expression"
  s.email = "mail@muflax.com"
  s.extra_rdoc_files = [
    "README"
  ]
  s.files = `git ls-files`.split("\n")
  s.homepage = "http://github.com/muflax/range_math"
  s.require_paths = ["lib"]
  s.summary = "do math on ranges"
end

