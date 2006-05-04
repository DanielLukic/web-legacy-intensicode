PARAMETERS: project_name, path_prefix = nil, text = project_name

path_prefix = relative_root unless path_prefix
link_path = File.join path_prefix, 'Section.Symbian', project_name, 'index.html'
%Q{ <%= link "#{link_path}", "#{project_name}" %> }