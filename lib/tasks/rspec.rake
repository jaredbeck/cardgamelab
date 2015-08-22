# Turn off rspec verbosity, so that the resultant rspec command, and all the
# spec names, are not echoed to stdout. See http://bit.ly/MoOoB3
if defined? RSpec
  task(:spec).clear
  RSpec::Core::RakeTask.new(:spec) do |t|
    t.verbose = false
  end
end
