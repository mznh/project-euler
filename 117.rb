#!/usr/bin/env ruby


def fact(n)
  if n == 0 then
    return 1
  end
  return n * fact(n-1)
end

#p 25 *16 *12
len = 50
ans = 0
(0..len/2).to_a.product((0..len/3).to_a, (0..len/4).to_a).each do |c2,c3,c4|
  if 2*c2+3*c3+4*c4 > len then
    next
  end
  c1 = len-(2*c2+3*c3+4*c4)
  #p  [c1,c2,c3,c4]
  c =  [c1,c2,c3,c4].sum
  ans += fact(c)/(fact(c1)*fact(c2)*fact(c3)*fact(c4))
end
p ans
