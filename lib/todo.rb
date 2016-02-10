#!/bin/env ruby
# encoding: utf-8

class TodoItem
  # include Listable
  attr_reader :description, :due, :priority

  def initialize(description, options={})
    @description = description
    @due         = options[:due] ? Date.parse(options[:due]) : options[:due]
    @priority    = options[:priority]
  end

  def format_description
    "#{@description}".ljust(25)
  end

  def format_date
    @due ? @due.strftime("%D") : "No due date"
  end

  def format_priority
    return " ⇧" if  @priority == "high"
    return " ⇨" if  @priority == "medium"
    return " ⇩" if  @priority == "low"
    return ""   if !@priority
  end

  def details
    format_description + "due: " +
    format_date +
    format_priority
  end
end
