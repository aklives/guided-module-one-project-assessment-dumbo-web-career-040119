class CommandLineInterface

  def run
    welcome
  end

  def welcome
    puts `clear`
    puts "Welcome to Band Ideas! Here we publish short reviews of our favorite, and least favorite music groups"
    puts "You may view our collection of reviews, bands, and authors, or become an author yourself and write your own review."
    puts "We recommend review lengths of one paragraph.  Hope you enjoy!"

  end
end
