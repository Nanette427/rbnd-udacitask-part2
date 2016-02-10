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

  def format_name
  end

  def format_date
  end

  # Returns a special char to indicate
  # the level of priority.
  #
  # Params:
  #  +priority+:: the level of priority (string), 
  #  can be nil
  def format_priority(priority)
  	return " ⇧" if  priority == "high"
  	return " ⇨" if  priority == "medium"
  	return " ⇩" if  priority == "low"
  	return ""   if !priority
  end
  # # From link
  # def format_name
  #   @site_name ? @site_name : ""
  # end
  
  # # From events
  # def format_date
  #   dates = @start_date.strftime("%D")         if @start_date
  #   dates << " -- " + @end_date.strftime("%D") if @end_date
  #   dates = "N/A"                              if !dates
  #   return dates
  # end

  # # From todo
  # def format_date
  #   @due ? @due.strftime("%D") : "No due date"
  # end
end
