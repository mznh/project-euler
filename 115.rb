#!/usr/bin/env ruby

@memo = {}


def init m
  @memo[0] = 0
  (1..m-1).each do |i|
    @memo[i] = 1
  end
  @memo[m] = 2
end

def solve m,n,d=0
  if @memo.has_key? n then 
    return @memo[n]
  end
  ans = 2 # all block and only first blank
  (0..n-(m + 1)).each do |i| 
    ans += solve(m,i,d+1)
  end
  ans += solve(m,n-1,d+1)
  @memo[n] = ans
  ans
end

@goal = 1000000
def bin_search m,l,r
  c = (l+r)/2

  ans = solve(m,c)
  if r-l <= 1 then 
    return r
  end

  if ans > @goal then
    return bin_search(m,l,c)
  else
    return bin_search(m,c,r)
  end
end

m = 50
init m
p bin_search m,1,1000



