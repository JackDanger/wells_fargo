module WellsFargo
  extend self

  # swiped from ActiveSupport
  def camelize word
    word.to_s.gsub(/\/(.?)/) {
      "::#{$1.upcase}"
    }.gsub(/(?:^|_)(.)/) {
      $1.upcase
    }
  end

  def underscore word
    word = word.to_s.dup
    word.gsub! /([A-Z]+)([A-Z][a-z])/,'\1_\2'
    word.gsub! /([a-z\d])([A-Z])/,'\1_\2'
    word.tr! "-", "_"
    word.downcase!
    word
  end
end

require 'builder'
require File.expand_path File.join(File.dirname(__FILE__), 'wells_fargo', 'payment_manager')
require File.expand_path File.join(File.dirname(__FILE__), 'wells_fargo', 'schema')
require File.expand_path File.join(File.dirname(__FILE__), 'wells_fargo', 'element')
