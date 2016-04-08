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

  def self.list_all
    @@all.each {|instance| puts "#{instance.name}"}
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

  def self.list_projects(developer)
    #binding.pry
    if Developer.all.each do |dev|
      if dev.name == developer
      #binding.pry
        dev.projects.each {|instance| puts "#{instance.name}"}
      end
    end
    else
      puts "That's not a developer! Try again"
    end
  end
#  binding.pry
end
