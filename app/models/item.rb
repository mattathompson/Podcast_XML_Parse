require 'open-uri'

class Item < ActiveRecord::Base
  belongs_to :user

  def self.content(media)

    binding.pry

  end




  def self.import(file)
    binding.pry
    xml = Nokogiri::XML(file)
    item = xml.xpath("//item")[0]
    h3 = Nokogiri::XML::Node.new "h3", xml
    h3.content = "New Node"
    item.add_previous_sibling(h3)

    xml.to_xml
  end


end
