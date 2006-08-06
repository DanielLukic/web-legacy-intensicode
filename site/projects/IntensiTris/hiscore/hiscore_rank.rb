
class HiscoreRank

  attr_reader :score, :level, :name

  def initialize( score, level, name )
    @score = score.to_i
    @level = level.to_i
    @name = name
  end

  def ==( val )
    score == val.score && level == val.level && name.downcase == val.name.downcase
  end

  def ===( val )
    score === val.score && level === val.level && name.downcase === val.name.downcase
  end

  def to_s
    "#{@score} #{@level} #{@name}"
  end

end
