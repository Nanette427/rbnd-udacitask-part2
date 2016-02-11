class UdaciList
  attr_reader :title, :items

  def initialize(options={})
    @title = options[:title]
    @items = []
  end

  # Add new item to the list
  # Params:
  #   +type+:: the type of the item
  #   +description+:: a description
  #   +options+:: a hash of options
  #      +priority+:: a string that give the priority
  #      +due+:: the due date for TodoItem
  #      +start_date+:: the start date for an EventItem
  #      +end_dat+:: the end date for an EventItem
  def add(type, description, options={})
    type = type.downcase
    begin 
      raise UdaciListErrors::InvalidItemType, "#{type} is not a valid type." if 
        !is_valid_type?(type)
      priority = options[:priority]
      raise UdaciListErrors::InvalidPriorityValue, "#{priority} is not a valid priority" if
        priority && !["low","high","medium"].include?(priority)
    rescue => e
      puts "#{e.class}: #{e.message}"
      return
    end
    @items.push TodoItem.new( description, options) if type == "todo"
    @items.push EventItem.new(description, options) if type == "event"
    @items.push LinkItem.new( description, options) if type == "link"
  end

  # Delete an item at a specific index.
  # Warning use human convention so if 
  # index == 1 remove index 0 of the @items 
  # array
  # Params:
  #  +index+:: the index of the item we want remove
  def delete(index)
    begin
      raise UdaciListErrors::IndexExceedsListSize, 'wrong index' if 
        @items.delete_at(index - 1) == nil
    rescue => e
      puts "#{e.class}: #{e.message}"
      return
    end
  end
  
  # Delete items
  # 
  # Params: 
  #   +index+: index of item to delete (one or more)
  #   used 1 to x convention so need a shift of one
  #   when deleting in @items array
  def delete_items(*index)
    index.each { |i| @items.delete_at(i-1) }
  end

  # Print the list 
  def all
    rows  = []
    @items.each_with_index do |item, position|
      rows << ["#{position + 1}", item.details, extract_type(item)] 
    end
    table = Terminal::Table.new(
      :title    => @title || "Unkown title",
      :headings => ['Position', 'Details', 'Type'], 
      :rows     => rows
    )
    puts table
  end

  # For a specific item extract the type
  # 
  # Params:
  #  +item+:: a single item
  def extract_type(item)
    (item.class).to_s.sub("Item","")
  end

  # Return a boolean that indicate if a given
  # type is valid or not
  # 
  # Params:
  #  +type+:: the type we want to test
  def is_valid_type?(type)
    ["todo","event","link"].include?(type)
  end

  # Return list of item with a specific type
  # or return a message
  #
  # Params: 
  #  +filter+: type of event we want to select
  def filter(type)
    filtered_items = @items.select { |item| extract_type(item).downcase == type.downcase }
    return filtered_items.empty? ? "No '#{type}' items found" : filtered_items
  end

end
