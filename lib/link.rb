class LinkItem
  include Listable
  
  attr_reader :description, :site_name

  def initialize(url, options={})
    @description = url
    @site_name   = options[:site_name]
  end

  # Returns a formattesd string that details the item
  def details
    format_description(@description, 25) + "site name: " + (@site_name || "")
  end
end
