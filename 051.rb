#!/usr/bin/env ruby

require 'prime'

"012 3456789"
# 少なくとも 0-2のどれかは素数

def change_digits(num,from,to)
  num.to_s.gsub(/#{from}/,to.to_s).to_i
end

target = 8
(5..10).each do |digit|
  primes =  Prime.each(10**digit-1).select{|i|i>=10**(digit-1)}.to_a
  candidate_list = primes.map{|pn|
    num = nil
    if pn.to_s.index("0") then
      num = 0
    elsif pn.to_s.index("1") then
      num = 1
    elsif pn.to_s.index("2") then
      num = 2
    end
    [pn,num]
  }.select{|pn,num|num }
  candidate_list.each do |pn,n|
    if (n..9).map{|t| change_digits(pn,n,t)}.select{|i|i.prime?}.length >= target then
      p pn
      exit
    end
  end
end

