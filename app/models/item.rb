require 'open-uri'
require 'uri'
require 'net/http'
require 'builder'
require 'taglib'

class Item < ActiveRecord::Base
  belongs_to :user
  has_many :attachments



  def media_length(media)
    f = self.attachments.new(audio: media)
    f.save!

    file = media.tempfile
    TagLib::MPEG::File.open(file.path) do |file|
      properties = file.audio_properties
      length = properties.length
    end
  end




  def import(params, podcast)
    length = self.media_length params[:audio]

    original = Nokogiri::XML(params[:xml])

    items = original.xpath("//item")[0]

    buffer = ""
    builder = ::Builder::XmlMarkup.new(:target=>buffer, :indent=>6)
    builder.item { |b|
                  b.title(params[:title]);
                  b.itunes :author, podcast.author
                  b.tag! ("description") { b.cdata! podcast.cdata }
                  b.itunes :subtitle, params[:subtitle]
                  b.itunes :summary, podcast.summary
                  b.enclosure :url => params[:file_location],  :length => (params[:audio].tempfile.size), :type => params[:audio].content_type
                  b.link(podcast.link);
                  b.guid(params[:file_location]);
                  b.pubDate(Time.parse(params[:pubDate]).strftime("%a, %d %b %Y %H:%M:%S %z"));
                  b.category(params[:category]);
                  b.explicit("No");
                  b.duration(Time.at(length).utc.strftime("%H:%M:%S"));
                  b.keywords(podcast.keywords);
                }
    items.add_previous_sibling(buffer)
    original.to_xml(:indent => 6)
  end


end
