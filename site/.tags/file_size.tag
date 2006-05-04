PARAMETERS: file_name

size = File.size File.join( input_dir, file_name )
case size.to_s.length
  when 0..3 then return "#{size} Bytes"
  when 4..6 then return "#{size/1024} KBytes"
  else return "#{size/1024/1024} MBytes"
end
