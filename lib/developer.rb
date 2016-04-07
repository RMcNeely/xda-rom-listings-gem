require 'pry'

class Developer

  attr_accessor :projects
  attr_reader :name
  @@all = []
  @projects = []

  def initialize(name)
    name = name.split("123")
    @name = name.last
    @projects  =[]
    @@all << self
  end

  def self.all
    @@all
  end

  def self.associate_project
    @@all.each do |person|
      person.projects << project.name
    end
  end

  def add_project(project)
    @projects << project
    project.developer = self
  end

  def add_appointment(appointment)
    @appointments << appointment
    appointment.doctor = self
  end
#  binding.pry
end
