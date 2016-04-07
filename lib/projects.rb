require 'pry'

class Project
  attr_accessor :name, :developer
  @@all = []
  @@roms = []
  @kernels = []
  @other_projects = []
  @developer

  def initialize(name)
    @name = name
    @@all << self
    #doctor.add_appointment(self)
    #developer.add_project(self)
  end

  def self.all
    @@all
  end

  def self.roms
    @@roms.each {|project| puts "#{project.name}"}
  end

  def self.kernels
    @kernels.each {|instance| puts "#{instance.name}"}
  end

  def self.sort
    @@all.each do |project|
    if project.name.include?("ROM")
      @@roms << project
    elsif project.name.include?("KERNEL")
      @kernels << project
    else
      @other_projects << project
    end
    end
  end
#binding.pry

end
