class CommandLineInterface

  def run
    welcome
  end

  def welcome
    puts `clear`
    puts "Welcome to Band Ideas! Here we publish short reviews of our favorite, and least favorite music groups"
    puts "You may view our collection of reviews, bands, and authors, or become an author yourself and write your own review."
    puts "We recommend review lengths of one paragraph."
    puts "Hope you enjoy!"
    input = nil
    while input == nil
      puts "Press enter for main menu."
      input = gets
    end
    display_menu
  end

  def display_menu
    puts `clear`
    puts "Please enter a number from one of the following options:"
    puts "1. See a list of Posts."
    puts "2. See a list of Authors."
    puts "3. See a list of Bands."
    puts "4. Become and Author and write a Post!"
    puts "5. Edit a Review."
    puts "6. Delete a Review"
    puts "7. Exit Band Ideas"
    input = gets.chomp
    if input == '1'
      list_posts
    elsif input == '2'
      list_authors
    elsif input == '3'
      list_bands
    elsif input == '4'
      write_post
    elsif input == '5'
      edit_post
    elsif input == '6'
      delete_post
    elsif input == '7'
      puts "Thanks for checking us out! Keep listening and writing!"
    elsif input == 'exit'
      puts "Thanks for checking us out! Keep listening and writing!"
    else
      puts "#{input} was invalid. Please try again."
      sleep 3
      display_menu
    end

  end

  def list_posts
    puts `clear`
    counter = 1
    Post.all.each do |post|
      puts "#{counter}. #{post.author.name}: '#{post.band.name}.'"
      puts "#{post.title}"
      puts "#{post.post}"
      counter += 1
    end
    input = nil
    while input == nil
      puts "Press enter to return to main menu."
      input = gets
    end
    display_menu
  end

  def list_authors
    puts `clear`
    counter = 1
    authors = Author.select(:name).map(&:name).uniq
    authors.each do |author|
      puts "#{counter}. #{author}."
      counter += 1
    end
    input = nil
    while input == nil
      puts "Press enter to return to main menu."
      input = gets
    end
    display_menu
  end

  def list_bands
    puts `clear`
    counter = 1
    Band.all.each do |band|
      puts "#{counter}. #{band.name}."
      counter += 1
    end
    input = nil
    while input == nil
      puts "Press enter to return to main menu."
      input = gets
    end
    display_menu
  end

  def write_post
    puts `clear`
    puts "Congratulations on joining the team!"
    puts "Please enter your full name:"
    author_name = gets.chomp

    repeat = false


    author = Author.find_or_create_by(name: author_name)
    # Author.select(:name).map(&:name).each do |author|
    #   if author_name == author
    #     repeat = true
    #   end
    # end

    # if repeat == true
    #   author = Author.find_by(name: author_name)
    # else
    #   author = Author.create(name: author_name)
    # end
    puts "Please enter the name of the band you want to review:"
    band_name = gets.chomp

    repeat = false
    Band.select(:name).map(&:name).each do |band|
      if band_name == band
        repeat = true
      end
    end

    if repeat == true
      band = Band.find_by(name: band_name)
    else
      band = Band.create(name: band_name)
    end

    puts "Please enter the title of the Review:"
    post_title = gets.chomp
    puts "Please enter your Review text:"
    review = gets.chomp
    Post.create(title: post_title, author_id: author.id, band_id: band.id, post: review)
    puts "Congratulations! You have been published."
    input = nil
    while input == nil
      puts "Press enter to return to main menu."
      input = gets
    end
    display_menu
  end

  def edit_post
    puts `clear`
    puts "Review Titles:"
    Post.all.map {|p| puts p.title}
    input = false
    while input == false

      puts "Please enter the title of the Review:"

        review_title_input = gets.chomp

        repeat = false
        Post.select(:title).map(&:title).each do |title|
          if review_title_input == title
            repeat = true
          end
        end

        if repeat == true
          post = Post.find_by(title: review_title_input)
          input = true
        else
          puts "Invalid Review Title. Please Enter Again:"
        end
    end



    puts "Please enter your new Review paragraph:"
    review = gets.chomp
    post.update(post: review)
    puts "Congratulations, you have edited your post!"
    input = nil
    while input == nil
      puts "Press enter to return to the main menu."
      input = gets
    end
    display_menu
  end

  def delete_post
    puts `clear`
    puts "Review Titles:"
    Post.all.map {|p| puts p.title}
    puts "Please enter the title of the Review you want to delete:"
    review_title = gets.chomp
    post = Post.find_by(title: review_title)
    post.destroy
    puts "Congratulations, you have deleted this post from time and space."
    input = nil
    while input == nil
      puts "Press enter to return to main menu."
      input = gets
    end
    display_menu
  end

end
