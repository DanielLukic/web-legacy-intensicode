
def list_folders( pattern = '*' )
  matches = Dir.glob "#{input_dir}/#{pattern}"
  matches.collect! { |m| m if ( File.directory? m ) && ( ( File.basename m ) != 'CVS' ) }
  matches.compact!
  matches.map! { |name| name.sub "#{input_dir}/", '' }
  matches
end
