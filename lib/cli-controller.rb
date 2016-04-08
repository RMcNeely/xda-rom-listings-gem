class CLIController
  extend MainMenu
  attr_accessor :input, :threads

  @threads = []
  def initialize
    scraper = Scraper.new
    #binding.pry
    Scraper.fresh_scrape
    puts "Welcome to the XDA-Developers ROM updates Gem!"
    puts "This will allow you to check the LG-G3 for updates to various development projects."
    Scraper.projects_list.each do |thread|
      project = Project.new(thread[:project_name])
      developer = Developer.new(thread[:developer])
      developer.projects << project
      project.developer = developer
    end
    Project.sort
    @threads =  Project.all.each.with_index(1) {|project, index| puts "#{index}). #{project.name}"}
  end

  def get_input
    @input = gets.strip
  end

  def menu_selection(input)

    if @input == "1" || @input == "List by threads"
      Project.all.each.with_index(1) {|project, index| puts "#{index}). #{project.name}"}

    elsif @input == "2" || @input =="List by project type"
      puts "Sort by ROMs, kernels, or other projects? (Type one to pick)"
      get_input
      if @input == "roms" ||@input == "ROMs"
        Project.roms
      elsif @input == "kernels"
        Project.kernels
      elsif @input == "other" || @input == "other prjects"
        Project.other
      else
        "Make a valid selection"
        get_input
      end

    elsif @input == "3" || @input == "List by developer"
      Developer.list_all
      puts "Type a developers name to show their projects or just 'exit' to escape"
      get_input
      #binding.pry
      input = @input
      #binding.pry
      Developer.list_projects(input)
    else
      puts "Make a valid selection"
    end


  end

end
