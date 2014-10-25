require 'open-uri'
require 'builder'
require 'taglib'

class Item < ActiveRecord::Base
  belongs_to :user



  def self.media_length(media)
    file = media.tempfile

    TagLib::MPEG::File.open(file.path) do |file|
      properties = file.audio_properties
      length = properties.length
    end

  end




  def self.import(params, podcast)
    length = Item.media_length params[:media]

    original = Nokogiri::XML(params[:xml])
    items = original.xpath("//item")[0]

    buffer = ""
    builder = ::Builder::XmlMarkup.new(:target=>buffer, :indent=>2)
    builder.item { |b|
                  b.title(params[:title]);
                  b.tag! ("itunes:author") { b.text! podcast.author };
                  b.tag! ("description") { b.cdata! podcast.cdata };
                  b.tag! ("itunes:subtitle") { b.text! params[:subtitle] };
                  b.tag! ("itunes:summary") { b.text! podcast.summary };
                  b.enclosure :url => params[:file_location],  :length => (params[:media].tempfile.size), :type => params[:media].content_type
                  b.link(podcast.link);
                  b.guid(params[:file_location]);
                  b.pubDate(params[:pubDate].strftime("%a, %d %b %Y %H:%M:%S %z"));
                  b.category(params[:category]);
                  b.explicit(params[:explicit]);
                  b.duration(Time.at(length).utc.strftime("%H:%M:%S"));
                  b.keywords(podcast.keywords);
                }
    items.add_previous_sibling(buffer)
    original.to_xml
  end


end
