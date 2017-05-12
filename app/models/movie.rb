class Movie
  attr_accessor :title

  @@all = []

  def initialize(title)
    self.title = title
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find_by_title(title)
    @@all.find do |movie|
      movie.title == title
    end
  end

  def ratings
    Rating.all.select { |rate| rate.movie == self }
  end

  def viewers
    arr = ratings
    arr.collect { |rate| rate.viewer }.uniq
  end

  def average_rating
    arr = ratings
    arr.collect { |rate| rate.score }.reduce(:+) / arr.size.to_f
  end

end
