class UdaciList
  attr_reader :title, :items

  def initialize(options={})
    @title = options[:title]
    @items = []
  end

  def add(type, description, options={})
    type = type.downcase
    # Concider to add method valid_type?
    begin 
      raise UdaciListErrors::InvalidItemType, "#{type} is not a valid type." if 
        !["todo","event","link"].include?(type)
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
  # Params: 
  #   +index+: index of item to delete (one or more)
  #   used 1 to x convention so need a shift of one
  #   when deleting in @items array
  def delete_items(*index)
    index.each { |i| @items.delete_at(i-1) }
  end

  def all
    title = @title || "Unkown title"
    puts "-" * title.length
    puts title
    puts "-" * title.length
    @items.each_with_index do |item, position|
      puts "#{position + 1}) #{item.details}"
    end
  end
end
