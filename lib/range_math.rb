#!/usr/bin/env ruby
# coding: utf-8
# Copyright muflax <mail@muflax.com>, 2011
# License: GNU GPL 3 <http://www.gnu.org/copyleft/gpl.html>

class Range
  def +(other)
    pair_or_num :+, other
  end

  def -(other)
    pair_or_num :-, other
  end

  def *(other)
    pair_or_num :*, other
  end

  def /(other)
    pair_or_num :/, other.to_f
  end

  def **(other)
    pair_or_num :**, other
  end

  def %(other)
    pair_or_num :%, other
  end
  
  def to_f
    (self.begin.to_f..self.end.to_f)
  end

  def average
    (self.begin + self.end) / 2.0
  end

  def coerce(other)
    return self, other
  end

  def pair_or_num operator, other
    if other.is_a? Range
      calc_pairs operator, other
    elsif other.is_a? Numeric
      calc_pairs operator, (other..other)
    else
      raise NoMethodError
    end
  end
  
  def calc_pairs operator, other
    parts_x = [self.begin, self.end]
    parts_y = [other.begin, other.end]
    
    results = []
    parts_x.each do |x|
      parts_y.each do |y|
        results << x.send(operator, y)
      end
    end
    
    (results.min..results.max)
  end
end
