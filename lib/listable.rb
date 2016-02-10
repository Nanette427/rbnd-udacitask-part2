module Listable

  # Returns formatted description.
  # Params: 
  #  +description+:: the description itself (string)
  #  +ljust_size+:: size of the left justification (int)
  def format_description(description, ljust_size)
    "#{description}".ljust(ljust_size)
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

  # def format_priority
  #   return " ⇧" if  @priority == "high"
  #   return " ⇨" if  @priority == "medium"
  #   return " ⇩" if  @priority == "low"
  #   return ""   if !@priority
  # end

end
