# Text-based Game Challenge

class HoodDreams
 
  def initialize()
    @gender = nil
    @health = 100
    @street_rep = 10
    @stash = [ 'knife', 'lighter', 'cell phone' ]
    @gang = false
    @gun = false
  end

  def start_game 
            puts <<-ART
                          
            _______     ^^^
           |xxxxxxx|  _^^^^^_
           |xxxxxxx| | [][]  |
        ______xxxxx| |[][][] |
       |++++++|xxxx| | [][][]|      Hood Dreams
       |++++++|xxxx| |[][][] |
       |++++++|_________ [][]|
       |++++++|=|=|=|=|=| [] |
       |++++++|=|=|=|=|=|[][]|
___________|++HH++|  _HHHH__|   _________   _________  _________
     _______________   ______________      ______________
__________________  ___________    __________________    ____________
        ART
        puts "\n"
        puts "\n"
        puts "\n"

     'Welcome to Hood Dreams - Where the streets tell their own stories...'.each_char do |char|
      putc char
      sleep 0.05
    end
    putc "\n"
     'Get your street rep up or die trying'.each_char do |char|
      putc char
      sleep 0.05
    end
    putc "\n"

    
    'Choose your gender: (M)ale or (F)emale'.each_char do |char|
      putc char
      sleep 0.05
    end
    putc "\n"
    typed_gender = gets.chomp
    
    
    # checking gender and assigning name
    if typed_gender.upcase == 'F'
        @gender = typed_gender.upcase
        puts "\n"
        'Your hood name is Nia. You have 10 points of STREET REP and your HEALTH is at 100'.each_char do |char|
          putc char
          sleep 0.05
        end
        putc "\n"
      else         
      @gender = typed_gender.upcase
      puts "\n"
      'Your hood name is Dre. You have 10 points of STREET REP and your HEALTH is at 100'.each_char do |char|
        putc char
        sleep 0.05
      end
      putc "\n"
    end
    main_menu
  end

#main menu
  def main_menu
    puts "\n"
    puts "Where ya headed"
    puts "1. Cruise the Streets"
    puts "2. Hit the Club"
    puts "3. Check Your Stash"
    puts "4. Quit"
    puts "HEALTH: #{@health} STREET REP: #{@street_rep}"
    player_choice = gets.chomp

    if player_choice == '1'
      cruise_streets
    elsif player_choice == '2'
      hit_the_club
    elsif player_choice == '3'
      check_stash
    elsif player_choice == '4'
      'The streets are not for you.'.each_char do |char|
        putc char
        sleep 0.05
      end
      putc "\n"
      exit
    else
      'Standing there like a fool. Make a choice'.each_char do |char|
        putc char
        sleep 0.05
      end
      putc "\n"
      cruise_streets
    end
  end

#cruise streets
  def cruise_streets
    puts "\n"
    "You're walking the streets".each_char do |char|
      putc char
      sleep 0.05
    end
    putc "\n"
#inital gang comes towards
    if @gang == false 
      'You see a gang coming towards you'.each_char do |char|
        putc char
        sleep 0.05
      end
      putc "\n"
      puts "\n"
      puts 'What do you do...'
      puts '1. Approach gang'
      puts '2. Run away from gang'
      puts '3. Start a fight with the gang'
      puts '4. Go back to the main menu'
      player_choice = gets.chomp

      if player_choice == '1'
        "Approaching the gang made your street rep go up 10 points. Now it's at #{@street_rep + 10}".each_char do |char|
          putc char
          sleep 0.05
        end
        putc "\n"
        @street_rep += 10
        check_status
        approach_gang
      elsif player_choice == '2'
        run_away_from_initial_gang
      elsif player_choice == '3'
        "Your street rep went up 5 points for taking on a gang alone, but you're dumb and your health went down 40 points.".each_char do |char|
          putc char
          sleep 0.05
        end
        putc "\n"
        @street_rep += 5
        @health -= 40
        check_status
        main_menu
      elsif player_choice == '4'
        "Your street rep went down 5 points.".each_char do |char|
          putc char
          sleep 0.05
        end
        putc "\n"
        @street_rep -= 5
        check_status
        main_menu
      else
        'The streets are not for you.'.each_char do |char|
          putc char
          sleep 0.05
        end
        putc "\n"
        exit
      end
    end
    options = [ 'You come across a shady deal going down.', 'You come across a rival gang', 'You see an old lady', 'You see police patrolling' ]
    random_index = rand(options.length)
    puts options[random_index]

    if options[random_index] == 'You come across a shady deal going down.'
      puts 'What do you do?'
      puts '1. Jump in and take your cut'
      puts '2. Play it cool and keep moving'
      puts '3. Make a run for it'
      puts '4. Main menu'
      player_choice = gets.chomp

#shady deal
        if player_choice == '1'
          'Your cut includes a wad of cash, some gold chains, and a glock. Your street rep goes up 20 points'.each_char do |char|
            putc char
            sleep 0.05
          end
          putc "\n"
          @street_rep += 20
          @gun = true
          @stash << 'glock'
          @stash << 'gold chains'
          @stash << 'cash'
          check_status
          main_menu
        elsif player_choice == '2'
          "You're a lil too cool for school? Street rep goes down 10 points".each_char do |char|
            putc char
            sleep 0.05
          end
          putc "\n"
          @street_rep -= 10
          check_status
          main_menu
        elsif player_choice == '3' 
          run_away_from_initial_gang
        elsif player_choice == '4'
          "Your street rep went down 5 points.".each_char do |char|
            putc char
            sleep 0.05
          end
          putc "\n"
          @street_rep -= 5
          check_status
          main_menu
        else
          'The streets are not for you.'.each_char do |char|
            putc char
            sleep 0.05
          end
          putc "\n"
          exit
        end
    elsif options[random_index] == 'You come across a rival gang'
#rival gang
      puts 'What do you do?'
      puts '1. Stand and fight'
      puts '2. Try to make friends and recruit the other gang members'
      puts '3. Make a run for it'
      puts '4. Main menu'
      player_choice = gets.chomp
      if player_choice == '1'
        stand_and_fight
      elsif player_choice == '2'
        "You're soft, you're dumb, and you're not loyal!!! You get beat up and lose respect.\nYour street rep goes down 40 points and your health goes down 40 points".each_char do |char|
          putc char
          sleep 0.05
        end
        putc "\n"
        @street_rep -= 40
        @health -= 40
        check_status
        main_menu
      elsif player_choice == '3' 
        run_away_from_initial_gang
      elsif player_choice == '4'
        "Your street rep went down 5 points.".each_char do |char|
          putc char
          sleep 0.05
        end
        putc "\n"
        @street_rep -= 5
        check_status
        main_menu
      else 
        'The streets are not for you.'.each_char do |char|
          putc char
          sleep 0.05
        end
        putc "\n"
        exit
      end

    elsif options[random_index] == 'You see an old lady'
#old lady
      puts 'What do you do?'  
      puts '1. Respect your elders'
      puts '2. Looks like easy money'
      puts '3. Main menu'
      player_choice = gets.chomp
      if player_choice == '1'
        "That's old lady has more street rep than you!! She hits you with her cane. Your street rep drops 15 points and your health drops 5 points.".each_char do |char|
          putc char
          sleep 0.05
        end
        putc "\n"
        @street_rep -= 15
        @health -= 5
        check_status
        main_menu
      elsif player_choice == '2'
        "You take the old lady's pearls, Louis bag, and dentures\nThat's the type of heartless action that builds your street rep. Your rep increases 30 points".each_char do |char|
          putc char
          sleep 0.05
        end
        putc "\n"
        @street_rep += 30
        @stash << 'pearls'
        @stash << 'Louis bag'
        @stash << 'dentures'
        check_status
        main_menu
      elsif player_choice == '3' 
        "Your street rep went down 5 points.".each_char do |char|
          putc char
          sleep 0.05
        end
        putc "\n"
        @street_rep -= 5
        check_status
        main_menu
      else
        'The streets are not for you.'.each_char do |char|
          putc char
          sleep 0.05
        end
        putc "\n"
        exit
      end
    elsif options[random_index] == 'You see police patrolling'
#police patrol
      puts 'What do you do?'  
      puts '1. Mind your business and ignore the cops'
      puts '2. Act out and flip off the cops'
      puts '3. Main menu'
      player_choice = gets.chomp
      if player_choice == '1'
        "Real gangstas move in silence like lasagna - lil Wayne. Street rep goes up 10 points".each_char do |char|
          putc char
          sleep 0.05
        end
        putc "\n"
        @street_rep += 10
        check_status
        main_menu
      elsif player_choice == '2'
        "You caught the attention of 12 and now you have to run. Your street cred goes up by 10 and your health goes down by 10".each_char do |char|
          putc char
          sleep 0.05
        end
        putc "\n"
        @street_rep += 10
        @health += 10
        check_status
        main_menu
      elsif player_choice == '3' 
        "Your street rep went down 5 points.".each_char do |char|
          putc char
          sleep 0.05
        end
        putc "\n"
        @street_rep -= 5
        check_status
        main_menu
      else
        'The streets are not for you.'.each_char do |char|
          putc char
          sleep 0.05
        end
        putc "\n"
        exit
      end
    end
  end

#approach gang
  def approach_gang 
    puts "\n"
    puts 'You approach the gang and they offer to jump you in'
    puts '1. Thats whats up'
    puts '2. Not today fam'
    puts '3. Run away'
    puts '4. Main menu'
    player_choice = gets.chomp

    if player_choice == '1'
      "You got jumped in and your street rep went up 20 points and your health went down 15 points.".each_char do |char|
        putc char
        sleep 0.05
      end
      putc "\n"
      @gang = true
      @street_rep += 20
      @health -= 15
      check_status
      main_menu
    elsif player_choice == '2'
      "You turn down the gang and one of them shoots you in the arm. You lose 30 health points and 20 street rep points.".each_char do |char|
        putc char
        sleep 0.05
      end
      putc "\n"
      @health -= 30
      @street_rep -= 20
      check_status
      main_menu
    elsif player_choice == '3'
      run_away_from_initial_gang
    elsif player_choice == '4'
      "Your street rep went down 5 points.".each_char do |char|
        putc char
        sleep 0.05
      end
      putc "\n"
      @street_rep -= 5
      check_status
      main_menu
    else
      'The streets are not for you.'.each_char do |char|
        putc char
        sleep 0.05
      end
      putc "\n"
      exit
    end
  end

#run away from initial gang
  def run_away_from_initial_gang
    "Running away from a gang like a lil b$#%! takes away 10 street rep points.".each_char do |char|
      putc char
      sleep 0.05
    end
    putc "\n"
    @street_rep -= 10
    check_status
    main_menu
  end

 #check stash 
  def check_stash
    puts "\n"
    puts "HEALTH: #{@health}"
    puts "STREET REP: #{@street_rep}"
    puts "STASH: "
    @stash.each do |item|
      p item
    end
    puts "\n"
    puts "Press 'm' to go back to the main menu" 
    go_home = gets.chomp
    if go_home.downcase == 'm'
      main_menu
    end
  end

#hit the club  
  def hit_the_club
    puts "\n"
    'You pull up to the club...'.each_char do |char|
      putc char
      sleep 0.05
    end
    putc "\n"
    puts '1. Someone steps on your hyped sneaker'
    puts '2. You hit the bar and buy drinks for everyone'
    puts '3. You head over to the poker table to gamble'
    puts '4. Main menu'
    player_choice = gets.chomp

    if player_choice == '1'
      steps_on_sneaker
    elsif player_choice == '2'
      "You're the life of the party. Street rep goes up 15 points".each_char do |char|
        putc char
        sleep 0.05
      end
      putc "\n"
      @street_rep += 20
      check_status
      main_menu
    elsif player_choice == '3'
      poker_table
    elsif player_choice == '4'
      "Your street rep went down 5 points.".each_char do |char|
        putc char
        sleep 0.05
      end
      putc "\n"
      @street_rep -= 5
      check_status
      main_menu
    else
      'The streets are not for you.'.each_char do |char|
        putc char
        sleep 0.05
      end
      putc "\n"
      exit
    end
  end

#poker table
  def poker_table
    puts "\n"
    puts "You're at the poker table..."
    puts '1. Gamble'
    puts '2. Play it safe and watch'
    puts '3. Main menu'
    player_choice = gets.chomp

    if player_choice == '1'
      "You hit it big and win a bust down Rolex. Street rep increases by 20 points".each_char do |char|
        putc char
        sleep 0.05
      end
      putc "\n"
      @street_rep += 20
      @stash << 'bust down Rolex'
      check_status
      main_menu
    elsif player_choice == '2'
      "While watching you get pick pocketed. Chasing after the pick-pocketer, you lose 20 health and street rep points".each_char do |char|
        putc char
        sleep 0.05
      end
      putc "\n"
      @street_rep -= 20
      @health -= 20
      check_status
      main_menu
    elsif player_choice == '3'
      "Your street rep went down 5 points.".each_char do |char|
        putc char
        sleep 0.05
      end
      putc "\n"
      @street_rep -= 5
      check_status
      main_menu
    else
      'The streets are not for you.'.each_char do |char|
        putc char
        sleep 0.05
      end
      putc "\n"
      exit
    end
  end

  def stand_and_fight
    puts "\n"
    "You're earning your stripes. Street rep goes up 20 points, but your health goes down 20 points".each_char do |char|
      putc char
      sleep 0.05
    end
    putc "\n"
    @street_rep += 20
    @health -= 20
    check_status
    main_menu
  end

#steps on sneaker
  def steps_on_sneaker
    puts "\n"
    "'Someone steps on your sneaker...'".each_char do |char|
      putc char
      sleep 0.05
    end
    putc "\n"
    puts '1. Let it go'
    puts '2. Pull out your glock'
    puts '3. Stand and fight'
    puts '4. Main menu'
    player_choice = gets.chomp

    if player_choice == '1'
      "Allowing someone to disrespect your shoes is disrespecting sneaker culture. You lose 20 street rep points".each_char do |char|
        putc char
        sleep 0.05
      end
      putc "\n"
      @street_rep -= 20
      check_status
      main_menu
    elsif player_choice == '2'
      if @gender == "M"
        "You turn your glock sideways and miss. They pull out their gun and shoot you.\n Now your hood dreams are over. RIP Dre. Your face is on a t-shirt. ".each_char do |char|
          putc char
          sleep 0.05
        end
        putc "\n"
        exit
      else 
        "You turn your glock sideways and miss. They pull out their gun and shoot you.\n Now your hood dreams are over. RIP Nia. Your face is on a t-shirt.".each_char do |char|
          putc char
          sleep 0.05
        end
        putc "\n"
        exit
      end
    elsif player_choice == '3'
      stand_and_fight
    elsif player_choice == '4'
      "Your street rep went down 5 points.".each_char do |char|
        putc char
        sleep 0.05
      end
      putc "\n"
      @street_rep -= 5
      check_status
      main_menu
    else
      'The streets are not for you.'.each_char do |char|
        putc char
        sleep 0.05
      end
      putc "\n"
      exit
    end
  end

  def stand_and_fight
    puts "\n"
    "You're earning your stripes. Street rep goes up 20 points, but your health goes down 20 points".each_char do |char|
      putc char
      sleep 0.05
    end
    putc "\n"
    @street_rep += 20
    @health -= 20
    check_status
    main_menu
  end

 #check status 
  def check_status
    if @health <= 0
      puts "\n"
      'You lose. Now your hood dreams are over. RIP. Your face is on a t-shirt.'.each_char do |char|
      putc char
      sleep 0.05
      end
      putc "\n"
      exit
    elsif @street_rep >= 100
      if @gender == "M"
        puts "\n"
        "Turning towards the mirror, Dre, the hoodiest of them all, gazes upon his reflection, knowing that in the rugged streets and alleys, his presence reigns supreme. Mirror mirror on the wall, who's the realest in the hood of them all? It's you, Dre, without a doubt. You have lived up to your Hood Dreams".each_char do |char|
        putc char
        sleep 0.05
        end
        putc "\n"
      else
        puts "\n"
        "Turning towards the mirror, Nia, the hoodiest of them all, gazes upon her reflection, knowing that in the rugged streets and alleys, her presence reigns supreme. Mirror mirror on the wall, who's the realest in the hood of them all? It's you, Nia, without a doubt. You have lived up to your Hood Dreams".each_char do |char|
        putc char
        sleep 0.05
        end
        putc "\n"
      end
      exit
    end
  end

end

new_game = HoodDreams.new
new_game.start_game