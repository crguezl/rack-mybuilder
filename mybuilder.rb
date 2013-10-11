module Rack
  class MyBuilder

    def initialize(&block)
      @use = []
      instance_eval(&block) if block_given?
    end

    def use(middleware, *args, &block)
      @use << proc { |app| middleware.new(app, *args, &block) }
    end

    def run(app)
      @run = app
    end

    def to_app
      @use.reverse.inject(@run) { |app, middleware| middleware[app] }
    end

    def call(env)
      to_app.call(env)
    end

  end
end

