#!/usr/bin/env ruby 

module FiboGenerator
  extend Enumerable

  def self.each
    return enum_for unless block_given?

    a, b = 0, 1
    loop do
      yield a
      a, b = b, a + b
    end
  end
end


ans = 0
p "89"[-10..-1]
FiboGenerator.each_with_index do |i, idx|
  #p "#{idx}: #{i}"
  if i.to_s.length < 9 then
    next
  end
  if idx % 10000 == 0 then
    p idx
  end
  t = "123456789".chars.sort
  m = i.to_s[0..8].chars.sort
  n = i.to_s[-9..-1].chars.sort
  if t == n and t == m then
    p idx
    break
  end
end
