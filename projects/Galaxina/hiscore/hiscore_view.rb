#!/usr/bin/ruby

require 'erb'
require 'hiscore'

class HiscoreView

  TEMPLATE_FILE_NAME = 'hiscore_view.rhtml'

  def self.process( filenames, template = TEMPLATE_FILE_NAME )
    hiscores = []
    filenames.each do |filename|
      hiscore = Hiscore.load filename
      hiscores << hiscore
    end

    view = HiscoreView.new hiscores

    rhtml = IO.readlines( template ).join( '' )
    erb = ERB.new rhtml

    erb.result view.get_binding
  end

  def get_binding
    binding
  end
  
  private
  
  def initialize( hiscores )
    @hiscores = hiscores
  end
  
  def each_hiscore( &block )
    @hiscores.each &block
  end
  
end
