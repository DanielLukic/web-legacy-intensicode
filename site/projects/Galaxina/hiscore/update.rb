#!/usr/bin/ruby

require 'cgi_util'
require 'hiscore_update'

begin

  inputlines = []
  while line = gets
      inputlines << line
  end

  hiscore, filename = HiscoreUpdate.process inputlines
  File.open( filename, 'wb' ) { |f| f.write( hiscore.to_s ) }

  content = ''
  content << hiscore.to_s
  content << "\n\n"
  content << "filename = #{filename}"
  content << "\n"

  CgiUtil.send_response content

rescue Exception => e

  bt = e.backtrace.join( "\n" )
  bt.gsub!( /.*www\.intensicode\.net/, '' )

  content = "RUBY: #{VERSION}\n"
  content << "ERROR: #{e}\n"
  content << "ERROR: #{bt}\n"

  CgiUtil.send_response content

  throw

end
