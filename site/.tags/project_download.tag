PARAMETERS: description, file_name, latest = true

content = latest_download description, file_name if latest
content = download description, file_name unless latest

%Q{<div class="project_download">#{content}</div>}
