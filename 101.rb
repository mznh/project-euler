#!/usr/bin/env ruby 

require 'matrix'

def u(n)
  (0..10).map {|i| (-1)**i * n**i }.inject(&:+)
end


ans = 0

# m次の項までの近似
11.times { |m|
  mat = Matrix.rows((1..m+1).map{|i| (0..m).map{|j| i**j} })
  vec = Vector.elements( (1..m+1).map{|n| u(n)}.to_a)
  sol = mat.lup.solve(vec)
  #p mat,vec
  #p sol
  (1..12).each do |x|
    v = Vector.elements((0..m).map{|j| x**j})
    #p "m= #{m}"
    #p "#{v.dot(sol).to_i},#{u(x)}"
    if v.dot(sol).to_i != u(x) then
      ans += v.dot(sol).to_i
      break
    end
  end
}
p ans 


