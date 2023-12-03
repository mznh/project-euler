#!/usr/bin/env ruby

require 'prime'

def sort_num(i)
  i.to_s.chars.sort
end


digit = 6

start_num = 10**(digit-1)
end_num = 10**digit/2
ans = 0
  (start_num..end_num).each do|i|
    if sort_num(i) == sort_num(i*2) and
      sort_num(i) == sort_num(i*3) and
      sort_num(i) == sort_num(i*4) and
      sort_num(i) == sort_num(i*5) and
      sort_num(i) == sort_num(i*6) then 
      ans = i
      break
    end
end

p ans
