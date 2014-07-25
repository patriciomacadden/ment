require 'bundler/setup'

require 'cuba'
require 'hobbit'
require 'oktobertest'
require 'oktobertest/contrib'

ENV['RACK_ENV'] = 'test'

module Oktobertest
  class Test
    def with_env(environment)
      env, ENV['RACK_ENV'] = ENV['RACK_ENV'], environment
      yield
      ENV['RACK_ENV'] = env
    end
  end
end

App = Class.new do
  include Ment
end

Cuba.plugin Ment

HobbitApp = Class.new Hobbit::Base do
  include Ment
end
