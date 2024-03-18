#!/usr/bin/ruby

require 'cgi_util'
require 'hiscore_view'

begin

    filenames = Dir[ "*.hiscore" ]
    content = HiscoreView.process filenames
    CgiUtil.send_html content

rescue Exception => e

    bt = e.backtrace.join( "\n" )
    bt.gsub!( /.*www\.intensicode\.net/, '' )

    content = "RUBY: #{VERSION}\n"
    content << "ERROR: #{e}\n"
    content << "ERROR: #{bt}\n"

    CgiUtil.send_response content

    throw

end
