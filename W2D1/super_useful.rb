# PHASE 2
def convert_to_int(str)
  begin
    Integer(str)
  raise StandardError.new if str != Integer
  rescue
    puts "Not an Integer"
    return nil
  end
end

# PHASE 3
FRUITS = ["apple", "banana", "orange"]

def reaction(maybe_fruit)
    if FRUITS.include? maybe_fruit
      puts "OMG, thanks so much for the #{maybe_fruit}!"
    else
      begin
        raise StandardError
      rescue
        if maybe_fruit == "coffee"
          puts "You gave me coffee"
        else
          puts "Not a real fruit, please try again: "
        end
        feed_me_a_fruit
      end
    end
end

def feed_me_a_fruit
  puts "Hello, I am a friendly monster. :)"

  puts "Feed me a fruit! (Enter the name of a fruit:)"
  maybe_fruit = gets.chomp
  reaction(maybe_fruit)
end

# PHASE 4
class BestFriend
  def initialize(name, yrs_known, fav_pastime)
    @name = name
    @yrs_known = yrs_known
    @fav_pastime = fav_pastime

    raise StandardError.new("Check your year") if yrs_known < 5
    raise StandardError.new("Check your name") if name.empty?
    raise StandardError.new("Check favorite past time") if fav_pastime.empty?
  end

  def talk_about_friendship
    puts "Wowza, we've been friends for #{@yrs_known}. Let's be friends for another #{1000 * @yrs_known}."
  end

  def do_friendstuff
    puts "Hey bestie, let's go #{@fav_pastime}. Wait, why don't you choose. 😄"
  end

  def give_friendship_bracelet
    puts "Hey bestie, I made you a friendship bracelet. It says my name, #{@name}, so you never forget me."
  end
end
