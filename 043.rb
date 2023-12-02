#!/usr/bin/env ruby


def check(line)
  (
    (line.slice(1,3).map(&:to_s).join.to_i) %2 ==0 and 
    (line.slice(2,3).map(&:to_s).join.to_i) %3 ==0 and
    (line.slice(3,3).map(&:to_s).join.to_i) %5 ==0 and
    (line.slice(4,3).map(&:to_s).join.to_i) %7 ==0 and
    (line.slice(5,3).map(&:to_s).join.to_i) %11==0 and
    (line.slice(6,3).map(&:to_s).join.to_i) %13==0 and
    (line.slice(7,3).map(&:to_s).join.to_i) %17==0
  )
end


ans = 0
(0..9).to_a.permutation.each do |line|
  if line.first == 0 then next end
  if check(line) then
    ans += line.join.to_i
  end
end

p ans


