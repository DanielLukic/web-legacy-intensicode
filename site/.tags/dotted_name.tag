PARAMETERS: normal_name

while /[a-z][A-Z]/ =~ normal_name
	match = Regexp.last_match
	normal_name.insert match.begin( 0 ) + 1, '.'
end
normal_name
