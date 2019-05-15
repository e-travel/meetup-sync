begin
  require 'rspec/core/rake_task'

  desc 'Run specs'
  RSpec::Core::RakeTask.new(:spec) do |t|
    t.verbose = false
  end

  task :default => :spec
rescue LoadError
  # no rspec available
end
