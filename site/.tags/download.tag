PARAMETERS: name, file, path = ''

file_name = File.join path, file
size = file_size file_name
date = file_date file_name

description = name ? "#{name}: " : nil
%Q{ #{description}<ul><li><a href="#{file_name}">#{file}</a></li><li>(#{size} / #{date})</li></ul> }
