require 'pry'

class Project
  attr_accessor :name
  @@all = []
  @roms = []
  @kernals = []
  @other_projects = []
  def initialize(name)
    @name = name
    if @name.includes?("ROM")
      @roms << self
    elsif @name.includes?("KERNAL")
      @kernals << self
    else
      @other_projects << self
    end  
    @@all << self
  end

  def self.all
    @@all
  end


end
