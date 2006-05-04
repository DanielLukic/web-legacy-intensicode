
def list_file_names( pattern )
  matches = Dir.glob "#{input_dir }/#{pattern}"
  regex = Regexp.new Regexp.escape( "#{input_dir}/" )
  matches.map! { |name| name.sub regex, '' }
  matches.collect! { |m| m unless ( File.basename( m ) == 'CVS' ) }
  matches.compact!
  matches
end
