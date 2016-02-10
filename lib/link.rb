class LinkItem
  include Listable
  attr_reader :description, :site_name

  def initialize(url, options={})
    @description = url
    @site_name   = options[:site_name]
  end

  # XXXX See if can be removec
  def format_name
    @site_name ? @site_name : ""
  end
  
  def details
    format_description(@description, 25) + "site name: " + format_name
  end
end
