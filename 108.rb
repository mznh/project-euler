#!/usr/bin/env ruby

require 'prime'
require 'time'



# sum = x + y 

def solve_n(n)
  #print "n: #{n}, "
  n = n**2
  factor = n.prime_division
  factor_combi = factor.map do |a|
    (0..a.last).to_a.map{|i| a.first**i}
  end
  first = factor_combi.shift
  divisor_list = first.product(*factor_combi).map{|i|i.inject(:*)}.sort.map{|i| [i,n/i]}
  divisor_list.select{|e| e.first>= e.last }.uniq
end


#p solve_n(ARGV[0].to_i).uniq.length


(900000000...).each do |n|
  ans = solve_n(n)
  if ans.uniq.length >= 4000000 then
    puts "#{n}" 
    puts "#{ans.uniq.length}" 
    break
  elsif n % 100000 == 0 then 
    puts "#{Time.now}"
    puts "#{n}" 
    puts "#{ans.uniq.length}" 
  end
end






