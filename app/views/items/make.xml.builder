xml.instruct!
xml.rss("version" => "2.0",  "xmlns:itunes" => "http://www.itunes.com/dtds/podcast-1.0.dtd", "xmlns:atom" => "http://www.w3.org/2005/Atom") do

  xml.tag!('item') do
    xml.title @item.title
    xml.tag!('itunes:author')  { xml.text! @item.author }
    xml.description @item.description
    xml.tag!('itunes:summary') { xml.text! @item.subtitle }
    xml.link @item.link
  end

end
