#!/usr/bin/ruby

require 'hiscore'

class HiscoreUpdate

  def self.process( inputlines )
    clientID = inputlines[ 0 ] || '[IntensiTris:IntensiTris:IntensiTris]'
    clientID = clientID.chomp
    raise "Missing client ID" unless clientID && clientID.length > 0

    filename = clientID.gsub( /[\[\]]/, '' ).gsub( /\:/, '_' ) + '.hiscore'
    if File.exists? filename
      hiscore = Hiscore.load filename
    else
      hiscore = Hiscore.new clientID
    end

    inputlines = inputlines.dup
    inputlines.delete_at 0
    inputlines.each { |line| hiscore.insert line }
    
    return hiscore, filename
  end

end
