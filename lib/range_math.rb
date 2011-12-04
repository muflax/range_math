#!/usr/bin/env ruby
# coding: utf-8
# Copyright muflax <mail@muflax.com>, 2011
# License: GNU GPL 3 <http://www.gnu.org/copyleft/gpl.html>

class Range
  def +(other)
    if other.is_a? Range
      (self.begin + other.begin)..(self.end + other.end)
    elsif other.is_a?  Numeric
      (self.begin + other)..(self.end + other)
    else
      raise NoMethodError
    end
  end

  def -(other)
    if other.is_a? Range
      (self.begin - other.begin)..(self.end - other.end)
    elsif other.is_a?  Numeric
      (self.begin - other)..(self.end - other)
    else
      raise NoMethodError
    end
  end

  def *(other)
    if other.is_a? Range
      (self.begin * other.begin)..(self.end * other.end)
    elsif other.is_a?  Numeric
      (self.begin * other)..(self.end * other)
    else
      raise NoMethodError
    end
  end

  def /(other)
    if other.is_a? Range
      (self.begin / other.begin.to_f)..(self.end / other.end.to_f)
    elsif other.is_a?  Numeric
      (self.begin / other.to_f)..(self.end / other.to_f)
    else
      raise NoMethodError
    end
  end

  def average
    (self.begin + self.end) / 2.0
  end

  def coerce(other)
    return self, other
  end    
end
