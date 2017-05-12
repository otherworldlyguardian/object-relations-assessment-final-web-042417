class Rating
  attr_accessor :score, :movie, :viewer

  @@all = []

  def initialize(movie, viewer, score)
    @movie, @viewer, @score = movie, viewer, score
    @@all << self
  end

  def self.all
    @@all
  end

end
