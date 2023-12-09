#!/usr/bin/env ruby


# x**n
def judge x,n
  #p (x**n).to_s
  #p "*"*n
  n <= (x**n).to_s.length
end

def bin_search l,r,n
  c = (l+r)/2
  #p [l,r]
  #p c
  if r-l <= 1 then
    if n ==  (r**n).to_s.length then
      return r
    else
      return nil
    end
  end
  if judge(c,n) then
    return bin_search(l,c,n)
  else
    return bin_search(c,r,n)
  end
end


ans = []

(1..100).each do |n|
  k = bin_search(1,100,n)
  if k then
    ans <<[k,n,k**n,"*"*n]
  end
end

ans.each do |k,n,kn,ns|
end
p ans.length
## n = 1~21 ってことがわかる


ans = 0
(1..22).each do|digit|
  (1..9).each do |x|
    if (x**digit).to_s.length == digit then
      ans += 1
    end
  end
end

p ans
