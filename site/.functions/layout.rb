
require 'erb'

def layout( template, variables )
  set_variables variables
  data = load_file template
  run_erb_on data, template
end
