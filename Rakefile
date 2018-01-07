# frozen_string_literal: true

desc 'Run algorithm based on input.txt data'
namespace :run do
  task :marsrover do
    sh 'ruby lib/main.rb input.txt'
  end
  task :time do
    start = Time.now
    sh 'ruby lib/main.rb input.txt'
    puts Time.now - start
  end
end

desc 'Running rspec suite'
task :test do
  sh 'rspec spec -fd'
end
