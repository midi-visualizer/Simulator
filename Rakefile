require "bundler/gem_tasks"
require "rake/testtask"

Rake::TestTask.new(:test) do |t|
  t.libs << "test"
  t.libs << "lib"
  t.test_files = FileList["test/**/*_test.rb"]
end

Rake::TestTask.new(:ruby2d) do |t|
  t.libs << "test"
  t.libs << "lib"
  t.test_files = FileList["test/**/*_ruby2d.rb"]
end

task :default => :test
