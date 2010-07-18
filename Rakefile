require 'rubygems'
require 'rake'
require 'bundler'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = "pickle-mongo_mapper"
    gem.summary = %Q{ianwhite's pickle mongo_mapper adapter}
    gem.email = "marcin.ciunelis@gmail.com"
    gem.homepage = "http://github.com/martinciu/pickle-mongo_mapper"
    gem.authors = ["Marcin Ciunelis"]
    gem.add_bundler_dependencies
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: gem install jeweler"
end

require 'spec/rake/spectask'
Spec::Rake::SpecTask.new(:spec) do |spec|
  spec.libs << 'lib' << 'spec'
  spec.spec_files = FileList['spec/**/*_spec.rb']
end

Spec::Rake::SpecTask.new(:rcov) do |spec|
  spec.libs << 'lib' << 'spec'
  spec.pattern = 'spec/**/*_spec.rb'
  spec.rcov = true
end

task :spec => :check_dependencies

task :default => :spec

