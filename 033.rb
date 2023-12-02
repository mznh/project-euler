#!/usr/bin/env ruby

a = (0..9).to_a


def is_feasible(x1,x0,y1,y0)
  (
    (y0*(10*x1+x0) == x0*(10*y1+y0) and x1 == y1) or
    (y1*(10*x1+x0) == x0*(10*y1+y0) and x1 == y0) or
    (y0*(10*x1+x0) == x1*(10*y1+y0) and x0 == y1) or
    (y1*(10*x1+x0) == x1*(10*y1+y0) and x0 == y0)
  ) and 
  (x1 != 0 and y1 != 0) and 
  (10*x1+x0) < (10*y1+y0)
end

def is_trivial(x1,x0,y1,y0) 
  !(x0 == y0 and x1 == y1) and
  !(x0 == x1 and y0 == y1) and
  !(x0 == 0 and y0 == 0) and
  !(x1 == 0 and y1 == 0)
end
match = a.product(a,a,a).select{ |elm| 
  is_trivial *elm  and is_feasible *elm
}.map(&:last).inject(&:*)
p match


