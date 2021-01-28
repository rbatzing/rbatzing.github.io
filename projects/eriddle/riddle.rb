# coding: utf-8

# :main: riddle.rdoc

##
# This class represents the data structures and method used to solve
# Einstein\'s Riddle by implementing  a recursive depth-first search of
# for a solution that satisfied all the rules given.
#
# == Example
# Given the above class, the actual instanceation and excution is
# only a two step operation: create a riddle object by
# defining the set of rules, and excute the +solver+ method
# 
# Rule definition array - encodes the symbols to be manipulated and
# compared for each house. The second half of the definitation
# handle cases that are linked to neighboring houses.
#
#  [position,color,pet,cigarette,drink,nation,
#     neighbor,color,pet,cigarette,drink,nation]
# where +neighbor+ given as
# [:nn] "next to" either leftside or rightside neighbor
# [:nl] "on the left of" or the rightside neighbor
#
#    r = Riddle.new(
#      [  # Rule related to a house       Associated neighbor attributes
#        [2,nil,nil,nil,:milk,nil,          nil,nil,nil,nil,nil,nil],
#        [0,nil,nil,nil,nil,:norway,        :n1,:blue,nil,nil,nil,nil],
#        [nil,:yellow,nil,:kool,nil,nil,    :nn,nil,:horse,nil,nil,nil],        
#        [nil,:green,nil,nil,:coffee,nil,   :nn,:ivory,nil,nil,nil,nil],
#        
#        [nil,:red,nil,nil,nil,:english,    nil,nil,nil,nil,nil,nil],
#        [nil,nil,:snail,:oldgold,nil,nil,  nil,nil,nil,nil,nil,nil],
#        [nil,nil,:dog,nil,nil,:spain,      nil,nil,nil,nil,nil,nil],
#        [nil,nil,nil,nil,:tea,:ukraine,    nil,nil,nil,nil,nil,nil],
#        [nil,nil,nil,:lucky,:orange,nil,   nil,nil,nil,nil,nil,nil],
#  
#        [nil,nil,nil,:chester,nil,nil,     :nn,nil,:fox,nil,nil,nil],
#        [nil,nil,nil,:parlment,nil,:japan, nil,nil,nil,nil,nil,nil],
#        [nil,nil,:zebra,nil,nil,nil,       nil,nil,nil,nil,nil,nil],
#        [nil,nil,nil,nil,:water,nil,       nil,nil,nil,nil,nil,nil]])
#
#    r.solver

class Riddle
  
  ##
  # - array of symbols that represent the rules to be satisfied

  attr_accessor :rules

  ##
  # - solution array that records all symbols and their position in the solution
  
  attr_accessor :solution

  ##
  # Constructs a new object with a blank solutions space and
  # an array of the +rules+ to be satified
  #
  # params: +rules+ as array that encodes all the rules/clues for this riddle
  
  def initialize(rules)
    @rules = rules
    @solution = [
      [nil,nil,nil,nil,nil],
      [nil,nil,nil,nil,nil],
      [nil,nil,nil,nil,nil],
      [nil,nil,nil,nil,nil],
      [nil,nil,nil,nil,nil]]
  end

  ##
  # Creates a string representation of the solution workspace.
  # +nil+ values are represented as "???"
  #
  # returns: [STRING] a multiline string rendering of the solution
  
  def to_s
    output = "================================\n"
    h = 0
    solution.each do |fields|
      h += 1
      output << "House #{h}: " 
      fields.each do |val|
        if val.nil?
          output << "???,"
        else
          output << "#{val},"
        end
      end
      output << "\n"
    end
    return output
  end
  
  ##
  # Key method that initiates the solving of the puzzle starting with
  # Rule 0. The final result of this recursive operation will determine
  # if the search for a solution was successful or not.
  #
  # The solution is labelled by its success.
  
  def solver
    if checkrule(0)
      puts "Success!!!"
    else
      puts "No solution found"
    end
  end

  protected

  ##
  # Recursively consider the placement of a rule and its successors.
  # The rule not only attempts placement of its symbols in a house
  # but also checks the neighboring houses if they are also involved 
  # The solution space is backed up on entry and restored if
  # the rule fails to render a solution. If the rule pertains to a
  # specific house, only that house (and its neighbors) are tested.
  # Otherwise all positions are attempted until a solution can be found.
  #
  # param: +rnum+ the index of the next rule to be considered
  # return:  [Boolean] indicating if the rule leads to a successful chain
  
  def checkrule(rnum)
    puts "Rule #{rnum}"
    puts self.to_s 
    if rnum >= @rules.length
      return(true)
    end
    reserve = backup
    if !@rules[rnum][0].nil? # A specific house is mentioned in the rule
      if attempt(@rules[rnum],@rules[rnum][0],@rules[rnum][6])
        return(true) if checkrule(rnum + 1)
      elsif @rules[rnum][6].eql?(:nn)
          restore(reserve)
          if attempt(@rules[rnum],@rules[rnum][0],:n1)
            return(true) if checkrule(rnum + 1)
          end
      end
    else      
      5.times do |h| # Check all the houses for a solution
        if attempt(@rules[rnum],h,@rules[rnum][6])
          return(true) if checkrule(rnum + 1)
        end
        if @rules[rnum][6].eql?(:nn)
          restore(reserve)
          if attempt(@rules[rnum],h,:n1)
            return(true) if checkrule(rnum + 1)
          end
        end
        restore(reserve)
      end
    end
    restore(reserve)
    return false
  end

  ##
  # Attempts the placement of symbols for a particular rule on a
  # particular house and a neighbor This function needs to be called
  # twice if both or either neighbor are involved.
  #
  # params:
  # * +rule+ index to the specific rule to be tested
  # * +h+ number of the house to be tested
  # * +type+ type of search: +nil+ just the house, +:nn+ both neighbors,
  # +:n1+ check one neighbor (the one on the right)
  #
  # return: [Boolean] indicating success in the placement of related symbols
  
  def attempt(rule,h,type)
    save = Array.new
    return false  if !checksuccess(rule,1,h)
    
    if type.nil?
      return true 
    
    elsif type.eql?(:nn) # check left house
      return false  if h < 1
      5.times do |i|
        save[i] = @solution[h-1][i]
      end

      if checksuccess(rule,7,h-1)
        return true
      else # rule fails; restore earlier values
        5.times do |i|
          @solution[h-1][i] = save[i]
        end
        return false
      end
      
    elsif type.eql?(:n1) # check right house
      return false if h > 3 
      5.times do |i|
        save[i] = @solution[h+1][i]
      end

      if checksuccess(rule,7,h+1)
        return true
      else # rule fails; restore earlier values
        5.times do |i|
          @solution[h-1][i] = save[i]
        end
        return false
      end
    end
  end

  ##
  # Check whether the house or its neighbor can accommodate the rule
  #
  # params:
  #  * +rule+ the contents of the rule under consideration
  #  * +offset+ what part of the rule 1 = the house, 7 = the neighbor
  #  * +house+ the house number
  #
  # returns: [Boolean] indicating that the rule can be accommodated
  
  def checksuccess(rule,offset,house)
    5.times do |i|
      if rule[i+offset].nil?
      elsif @solution[house][i].nil?
        @solution[house][i] = rule[i+offset]
      elsif @solution[house][i].eql?(rule[i+offset])
      else
        return false
      end
    end
    return true
    end

  ##
  # Checks if the solution space is valid
  # returns Boolean indicating that all symbols are uniquely placed
  
  def valid?
    tally = Hash.new(0)
    tally[:xxx] = 1
    
    5.times do |u|
      5.times do |h|
        if !@solution[h][u].nil?
          tally[@solution[h][u]] += 1
        end
      end
      return true if tally.values.max < 2
    end
    puts "invalid: #{tally.inspect}"
    puts self.to_s
    return false
  end

  ##
  # Back up a copy of the solution space
  # This requires the creation of a new array as the copy function
  # only copies the object id
  # Returns Array copy of the solution space  
  def backup
    copy = Array.new
    @solution.each do |row|
      house = Array.new
      row.each do |unit|
        house << unit
        end
      copy << house
    end
    return copy
  end

  ##
  # Restore the solutions space to its former values
  # Used in the case that an attempt fails
  
  def restore(copy)
    5.times do |h|
      5.times do |u|
        @solution[h][u] = copy[h][u]
      end
    end
  end
  
end

##
# Run the riddle if this class file called directly

if FILE==$0
  r = Riddle.new(
    [  # Rule related to a house       Associated neighbor attributes
      [2,nil,nil,nil,:milk,nil,          nil,nil,nil,nil,nil,nil],
      [0,nil,nil,nil,nil,:norway,        :n1,:blue,nil,nil,nil,nil],
      [nil,:yellow,nil,:kool,nil,nil,    :nn,nil,:horse,nil,nil,nil],        
      [nil,:green,nil,nil,:coffee,nil,   :nn,:ivory,nil,nil,nil,nil],
      
      [nil,:red,nil,nil,nil,:english,    nil,nil,nil,nil,nil,nil],
      [nil,nil,:snail,:oldgold,nil,nil,  nil,nil,nil,nil,nil,nil],
      [nil,nil,:dog,nil,nil,:spain,      nil,nil,nil,nil,nil,nil],
      [nil,nil,nil,nil,:tea,:ukraine,    nil,nil,nil,nil,nil,nil],
      [nil,nil,nil,:lucky,:orange,nil,   nil,nil,nil,nil,nil,nil],
  
      [nil,nil,nil,:chester,nil,nil,     :nn,nil,:fox,nil,nil,nil],
      [nil,nil,nil,:parlment,nil,:japan, nil,nil,nil,nil,nil,nil],
      [nil,nil,:zebra,nil,nil,nil,       nil,nil,nil,nil,nil,nil],
      [nil,nil,nil,nil,:water,nil,       nil,nil,nil,nil,nil,nil]])
  
  r.solver
end
