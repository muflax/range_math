#!/usr/bin/env ruby
# coding: utf-8
# Copyright muflax <mail@muflax.com>, 2011
# License: GNU GPL 3 <http://www.gnu.org/copyleft/gpl.html>

class Range
  def +(other) 	; pair_or_num :+, other     	; end
  def -(other) 	; pair_or_num :-, other     	; end
  def *(other) 	; pair_or_num :*, other     	; end
  def /(other) 	; pair_or_num :/, other.to_f	; end
  def **(other)	; pair_or_num :**, other    	; end
  def %(other) 	; pair_or_num :%, other     	; end

  def to_f	; (self.begin.to_f..self.end.to_f)  	; end
  def to_i	; (self.begin.round..self.end.round)	; end

  def round places=0
    (self.begin.round(places)..self.end.round(places))
  end

  def average
    (self.begin + self.end) / 2.0
  end

  def coerce(other)
    case other
    when Range  	; return other, self
    when Numeric	; return (other..other), self
    else
      super
    end
  end

  private

  def pair_or_num operator, other
    case other
    when Range  	; calc_pairs operator, other
    when Numeric	; calc_pairs operator, (other..other)
    else
      raise NoMethodError
    end
  end

  def calc_pairs operator, other
    results = [
      self.begin	.send(operator,	other.begin),
      self.begin	.send(operator,	other.end),
      self.end  	.send(operator,	other.begin),
      self.end  	.send(operator,	other.end),
    ]

    (results.min..results.max)
  end
end
