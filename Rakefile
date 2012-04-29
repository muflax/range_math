desc "open an irb session preloaded with this library"
task :console do
  sh "irb -Ilib -rrange_math"
end

desc "build a gem from the gemspec"
task :build do
  sh "mkdir -p pkg"
  sh "gem build range_math.gemspec"
  sh "mv range_math-*.gem pkg/"
end

desc "clean pkg"
task :clean do
  sh "rm -f pkg/*"
end


desc "install a gem"
task :install => [:clean, :build] do
  sh "gem install --no-format-executable pkg/range_math-*.gem"
end

task :default => :install
