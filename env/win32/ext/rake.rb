#!/usr/bin/env ruby -w

begin
  require 'rake'
rescue LoadError
  require 'rubygems'
  require 'rake'
end

Rake.application.run
