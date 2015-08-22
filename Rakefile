require 'rom/sql/rake_task'
require File.expand_path('../config/application', __FILE__)
Rails.application.load_tasks

# Set default task to run linters *then* tests.  Linters
# stop the build if code quality is too low.
task default: [] # in case it hasn't been set
Rake::Task[:default].clear
task default: [:rubocop, :slim_lint, :spec]
