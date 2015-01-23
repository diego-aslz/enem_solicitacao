require 'bundler/setup'

require 'minitest/autorun'

$:.unshift File.expand_path("../../lib", __FILE__)
require 'enem_solicitacao'

Dir["#{File.dirname(__FILE__)}/support/*.rb"].each { |f| require f }
