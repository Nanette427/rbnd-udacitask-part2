class UdaciList
  attr_reader :title, :items

  def initialize(options={})
    @title = options[:title]
    @items = []
  end

  def add(type, description, options={})
    type = type.downcase
    @items.push TodoItem.new( description, options) if type == "todo"
    @items.push EventItem.new(description, options) if type == "event"
    @items.push LinkItem.new( description, options) if type == "link"
  end
  
  def delete(index)
    @items.delete_at(index - 1)
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
    puts "-" * @title.length
    puts @title
    puts "-" * @title.length
    @items.each_with_index do |item, position|
      puts "#{position + 1}) #{item.details}"
    end
  end
end
