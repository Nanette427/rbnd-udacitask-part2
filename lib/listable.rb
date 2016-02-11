#!/bin/env ruby
# encoding: utf-8

module Listable

  # Returns formatted description.
  #
  # Params: 
  #  +description+:: the description itself (string)
  #  +ljust_size+:: size of the left justification (int)
  def format_description(description, ljust_size)
    "#{description}".ljust(ljust_size)
  end

  # Returns a special char to indicate
  # the level of priority.
  #
  # Params:
  #  +priority+:: the level of priority (string), 
  #  can be nil
  def format_priority(priority)
  	return " ⇧".colorize(:red)    if  priority == "high"
  	return " ⇨".colorize(:green)  if  priority == "medium"
  	return " ⇩".colorize(:yellow) if  priority == "low"
  	return ""   if !priority
  end

  # Returns a formatted strind that represent date
  # 
  # Params:
  #  +start_date+:: the start date
  #  +end_date+:: the end date
  def format_date(start_date=nil,end_date=nil)
  	dates = start_date.strftime("%D")         if start_date
  	dates << " -- " + end_date.strftime("%D") if end_date
  	dates = "No due date"                     if !start_date && !end_date
   return dates
  end

end
