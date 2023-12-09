#!/usr/bin/env ruby
#3-SATを使わずに解いてみる
require 'set'
require 'pp'


def box_id(y,x)
  3*(y/3)+(x/3)
end

def deep_copy(problem)
  new_problem = problem.map{|line| line.clone}
  new_problem
end

def calc_candidate y,x,problem,horizonal,vertical,box
  candidate = Set.new((1..9).to_a) - (horizonal[x] + vertical[y] + box[box_id(y,x)]) 
end


def solve problem,d=0
  horizonal = Array.new(9){Set.new}# horizonal[x]
  vertical  = Array.new(9){Set.new}# vertical[y]
  box       = Array.new(9){Set.new}# z

  zero_list = []
  #x→ y↓
  9.times do |y|
    9.times do |x|
      now = problem[y][x]
      if now == 0 then 
        zero_list << [y,x]
        next
      end
      horizonal[x] << now
      vertical[y] << now
      box[box_id(y,x)] << now
    end
  end

  while not zero_list.empty?  do
    next_zero_list = []
    # 消去法で確定するものはすべて確定
    zero_list.each do |y,x|
      candidate = calc_candidate(y,x,problem,horizonal,vertical,box)
      if candidate.size == 1 then
        val = candidate.first
        problem[y][x] = val 
        horizonal[x] << val 
        vertical[y] << val
        box[box_id(y,x)] << val
      elsif candidate.size == 0 then
        # 候補なしが出たら解なし
        return -1
      else
        next_zero_list << [y,x]
      end
    end

    # 減ってない場合場合分けして再帰
    if zero_list.length == next_zero_list.length then
      candidate_list = zero_list.map{|y,x| [y,x,calc_candidate(y,x,problem,horizonal,vertical,box)] }
      candidate_list.each do |y,x,c|
        #pp c
        # 未確定あり
        c.each do |n|
          np = deep_copy(problem)
          np[y][x] = n
          ans = solve(np,d+1)
          if ans != -1 then 
            return ans 
          end
        end
        return -1
      end
    end
    zero_list = next_zero_list
  end
  ## 解けた
  p "solve!"
  print problem
  return problem[0][0,3].map(&:to_s).join.to_i
end

def print problem
  puts "################"
  9.times do |y|
    puts  problem[y].map(&:to_i).join()
  end
end



ans = 0
50.times do 
  title = gets.chomp()
  problem = []
  p title
  p problem
  9.times do 
    problem << gets.chomp.chars.map(&:to_i)
  end
  #print problem
  ans += solve(problem)
end
p ans




