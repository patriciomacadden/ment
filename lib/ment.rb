module Ment
  VERSION = '0.2.0'

  extend self

  def self.included(othermod)
    othermod.extend self
  end

  def environment
    (ENV['RACK_ENV'] || 'development').to_sym
  end

  %w(development production staging test).each do |env|
    define_method("#{env}?") { environment == env.to_sym }
  end
end
