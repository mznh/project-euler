#!/usr/bin/env ruby

require 'humanize'

p 115.humanize.gsub(/ /,"")
p 115.humanize.gsub(/ /,"").length

p (1..1000).map{|i|i.humanize.gsub(/ /,"")}.join.length

# unsolved
