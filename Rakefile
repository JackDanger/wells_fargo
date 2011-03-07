require 'bundler'
Bundler::GemHelper.install_tasks

task :default => :test

require 'rake/testtask'
Rake::TestTask.new(:test) do |test|
  test.libs << '.'
  test.ruby_opts << '-rubygems'
  test.pattern = 'test/*.rb'
  test.verbose = true
end

desc "Refresh element definition files from schema.xml"
task :from_schema do
  system "ruby -rubygems -r lib/wells_fargo/schema.rb -e 'WellsFargo::Schema.generate_element_files'"
end