#!/usr/bin/env ruby


#(1..9).to_a.inject(&:*).times do |x|
#end


p "968745231".chars.sort

ans =  (5000..9999).select do |i|
  c = i.to_s+(i*2).to_s
  if c.chars.sort == "968745231".chars.sort then p c end
  c.chars.sort == "968745231".chars.sort
end



