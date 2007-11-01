
class CgiUtil

  def self.send_response( content )
    puts "Content-Type: text/plain\r\n"
    puts "Content-Length: #{content.length}\r\n"
    puts "\r\n"
    puts content
  end

  def self.send_html( content, noheader = false )
    puts "Content-Type: text/html\r\n"
    puts "Content-Length: #{content.length}\r\n"
    puts "\r\n"
    puts content
  end

end
