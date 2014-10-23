xml.instruct!
xml.rss("version" => "2.0",  "xmlns:itunes" => "http://www.itunes.com/dtds/podcast-1.0.dtd", "xmlns:atom" => "http://www.w3.org/2005/Atom") do
  xml.channel do
    xml.title "C316: Zach Adams"
    for item in @items
  		xml.item do
  			xml.title item.title
        xml.tag!('itunes:author')  { xml.text! item.author }
      end
  	end
  end
end
