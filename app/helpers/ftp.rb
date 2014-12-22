class ServerFTP
  require 'net/ftp'

  attr_accessor :ftp

  def initialize(url, username, password)
    @url = url
    @username = username
    @password = password
  end


  def setup
    @ftp = Net::FTP.new
    @ftp.passive = true
    @ftp.connect(@url)
    @ftp.login(@username, @password)
    @ftp
  end

  def setDir(directory)
    @ftp.chdir(directory)
  end

  def grab(file_name)
    @ftp.getbinaryfile(file_name)
  end

  def put(file_name)
    @ftp.putbinaryfile(file_name)
  end


end
