namespace :db do
  desc "Build for CI"
  task :build => ['db:migrate', :spec]
end
