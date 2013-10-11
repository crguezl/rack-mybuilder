desc "run app server"
task :default => :server

desc "run app server"
task :server, :greet  do |t, args|
  cheer = args[:greet] || 'bye, bye!'
  sh "ruby -I. app.rb #{cheer}"
end
