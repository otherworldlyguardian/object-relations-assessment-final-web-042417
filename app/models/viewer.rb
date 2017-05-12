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
