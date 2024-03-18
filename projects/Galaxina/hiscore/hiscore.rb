
require 'hiscore_rank'



class Hiscore

  public
  
  def self.load( filename )
    hiscoreLines = IO.readlines filename
    hiscoreID = hiscoreLines[ 0 ].chomp
    hiscore = Hiscore.new hiscoreID
    hiscoreLines.delete_at( 0 )
    hiscoreLines.each { |line| hiscore.insert line }
    hiscore
  end

  def initialize( hiscoreID )
    @hiscoreID = hiscoreID
    @ranks = []
    0.upto( 9 ) do |idx|
        @ranks << HiscoreRank.new( 10000 - idx * 1000, 10 - idx, "THE.FRENCH.DJ" )
    end
  end
  
  def name
    @hiscoreID
  end
  
  def each_rank( &block )
    @ranks.each &block
  end

  def insert( rank_spec )
    return unless /([0-9]+) ([0-9]+) (.*)/ =~ ( rank_spec.chomp )
    match = Regexp.last_match

    new_rank = HiscoreRank.new( match[ 1 ], match[ 2 ], match[ 3 ] )
    @ranks << new_rank unless @ranks.include? new_rank
    @ranks.sort! { |a,b| -( a.score <=> b.score ) }

    while @ranks.size > 10 do
      @ranks.delete_at( 10 )
    end
  end

  def to_s
    "#{@hiscoreID}\n" + @ranks.join( "\n" )
  end

end
