class Item
  include Listable

  def more_advanced_date
  	nil
  end

  #####################
  # All class methods #
  #####################

  # Extract all the descendants class
  def self.descendants
    ObjectSpace.each_object(Class).select { |klass| klass < self }
  end

  # Return a boolean. True if type correspond 
  # to an ascendant or false
  # 
  # Params:
  #  +type+:: The type we want to test
  def self.is_valid_type?(type)
  	descendants     = Item.descendants || []
  	available_types = descendants.map { |c_class| c_class.extract_type  }
    available_types.include?(type)
  end

  # From the class name extract the 
  # human readable type
  def self.extract_type
    self.to_s.sub("Item","").downcase
  end

end