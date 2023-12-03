#!/usr/bin/env ruby


@memo = {}
@memo[0] = 0
@memo[1] = 1
@memo[2] = 1
@memo[3] = 2
@memo[4] = 4

def solve n ,m
  #p "  "*d +"solve(#{n})"
  if @memo.has_key? n then 
    return @memo[n]
  end
  ans = 2 # all block and only first blank
  ans += solve(n-1,m)
  (0..n-(m + 1)).each do |i| 
    ans += solve(i,m)
  end
  @memo[n] = ans
  ans
end

p solve 7,3
