class Viewer
  attr_accessor :name, :first_name, :last_name

  @@all = []

  def initialize(name)
    @name = name
    @first_name = name.split(" ")[0]
    @last_name = name.split(" ")[1]
    @@all << self
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def self.all
    @@all
  end

  def self.find_by_name(name)
    @@all.find do |viewer|
      viewer.name == name
    end
  end

  def create_rating(movie, score)
    Rating.new(movie, self, score)
  end

end

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
