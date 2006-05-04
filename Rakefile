
require 'bxms/processor'

desc "Run BxMS to process 'site' into 'output'"
task :default => [ :make_site ]

task :make_site do
	bxms = BxMS::Processor.new
	bxms.verbose = true
	bxms.process :from => 'site', :to => 'output'
end
