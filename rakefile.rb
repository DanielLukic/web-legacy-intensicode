
require 'rake/clean'


CLEAN.include 'BxMS.log'
CLOBBER.include 'output'



# DEFAULT TARGET

desc "Run BxMS to process 'site' into 'output'"
task :default => [ :make_site ]



# PRIMARY TARGETS

task :make_site => [ :install_bxms ]
task :make_site do
    require 'rubygems'
    require 'bxms/processor'
	bxms = BxMS::Processor.new
	bxms.verbose = true
	bxms.process :from => 'site', :to => 'output'
end

task :deploy_site => [ :make_site ]
task :deploy_site do
end



# UTILITY TARGETS

task :install_bxms do
end
