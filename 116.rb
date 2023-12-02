#!/usr/bin/env ruby


# n: length of sum
# m: length of tile

def fact(n)
  if n == 0 then
    return 1
  end
  return n * fact(n-1)
end

def solve n,m
  c = n/m
  ans = 0
  (1..c).each do |i|
    c1 = n-i*m
    cm = i
    ans += fact(c1+cm)/(fact(c1)*fact(cm))
  end
  ans
end


p solve(50,2) + solve(50,3) + solve(50,4)
