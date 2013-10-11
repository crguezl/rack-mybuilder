require 'rack'
require 'thin'

require 'mybuilder'
require 'decorator'

app = Rack::MyBuilder.new do
  use Decorator, :header => "<strong>*********** header **********</strong><br/>"

  cheer = ARGV.shift || "<h1>Hello world!</h1>"
  run lambda { |env| [200, { 'Content-Type' => 'text/html' }, [ "<h1>#{cheer}</h1>" ]]}
end

Rack::Handler::Thin.run app, :Port => 3333, :Host => 'localhost'
