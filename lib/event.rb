class EventItem < Item
 
  attr_reader :description, :start_date, :end_date

  def initialize(description, options={})
    @description = description
    @start_date  = Chronic.parse(options[:start_date]) if options[:start_date]
    @end_date    = Chronic.parse(options[:end_date])   if options[:end_date]
  end

  # Returns a formatted string that details the item
  def details
    format_description(@description, 25) + "event dates: " + format_date(@start_date,@end_date)
  end

  # Return the end_date or the start_date
  # or nil both absent
  def more_advanced_date
    @end_date || @start_date || nil
  end
end
