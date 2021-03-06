class TodoItem < Item
  
  attr_reader :description, :due, :priority

  # Initialize a new TodoItem
  # Params: 
  #  +description+:: a description of the item 
  #  +options+:: a hash of options
  #    +due+:: the due date
  #    +priority+:: the priority 
  def initialize(description, options={})
    @description = description
    @due         = Chronic.parse(options[:due]) if options[:due]
    @priority    = options[:priority]
  end

  # Returns a formatted string with all 
  # the details
  def details
    format_description(@description,25) + "due: " +
    format_date(@due) +
    format_priority(@priority)
  end

  # Returns the due date if exist
  def more_advanced_date
    @due || nil
  end
end
