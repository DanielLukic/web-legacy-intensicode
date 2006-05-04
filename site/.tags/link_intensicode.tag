PARAMETERS: uri = '', text = nil

unless text
  text = uri.sub( /.*\//, '' ).sub( '.html', '' )
  text = 'IntensiCode' unless text.length > 0
end
uri = 'index.html' unless uri && uri.length > 0

%Q{<%= link "http://www.intensicode.net/#{uri}", "#{text}" %>}