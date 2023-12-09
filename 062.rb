#!/usr/bin/env ruby

@table = {}

(100..9000).each do |i|
  cubic = i**3
  sorted_text = cubic.to_s.chars.sort.join()
  if @table.has_key? sorted_text then
    @table[sorted_text] << cubic
  else 
    @table[sorted_text] = [cubic]
  end
end

p @table.select{|k,v| 
  v.length == 5
}


