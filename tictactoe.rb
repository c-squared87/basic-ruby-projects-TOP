class BoardSpace
  @@id_number = 0

  def initialize
    @@id_number += 1
    @icon = @@id_number.to_s
  end

  public
  def set_space_icon(icon)
    @icon = icon
  end
  def get_space_icon
      return @icon
  end
end


class Player
  attr_reader :name
  attr_reader :icon

  def initialize(name, icon)
    @name = name
    @icon = icon
  end
end

# TODO LIST:
# Keep player from overwriting same spaces
#   -detect if value is already there
# Exit case
# case in check_for_win if all slots have been full and tie game
#


class Game

  # TODO: Let's figure out how to get this dialog somewhere.
  def initialize
    puts "This is the correct file"
    puts "Enter Player 1 Name"
    name = gets
    @player_1 = Player.new(name, "X")

    puts "Enter Player 2 Name"
    name = gets
    @player_2 = Player.new(name, "O")

    puts "Welcome " + @player_1.name + " And " + @player_2.name


    #
    # if @space_array[0] == "1"
    #   puts "yes"
    #   exit
    # end

    generate_board

    # if @space_array[0].get_space_icon == "X"
    #   puts "YES"
    # else
    #   puts "NO"
    # end

    refresh_display
    new_turn(@player_1)
  end

  # TODO: we are going to work on this.
  public
  def new_turn(player)
    puts " #{player.name}, - enter a space number"
    choice = gets.to_i
    set_space_icon(choice -1, player)
    #
    # puts " #{@player_2.name}, - enter a space number"
    # choice = gets.to_i
    # set_space_icon(choice -1, @player_2.icon)

    # new_turn(@player_1)
  end

  private
  def generate_board
    @space_array = Array.new(0)
    i = 0
    while i < 9
      @space_array.push(BoardSpace.new)
      i +=1
    end
  end

  def set_space_icon(index, player)
    # Checks if a valid move before assigning.
    if @space_array[index].get_space_icon == "X" ||  @space_array[index].get_space_icon == "O"
      if player.icon == "X"
        new_turn(@player_1)
      else
        new_turn(@player_2)
      end
    end
    # end of this
    @space_array[index].set_space_icon(player.icon)
    refresh_display
    check_for_win
    if player.icon == "X"
      new_turn(@player_2)
    else
      new_turn(@player_1)
    end
  end

  def check_for_win
   win_cond= [ [0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6] ]
   win_cond.each do |condidion|
     win_game(@player_1) if condidion.all? { |cell| @space_array[cell].get_space_icon=="X" }
     win_game(@player_2) if condidion.all? { |cell| @space_array[cell].get_space_icon=="O" }
   end
  end

  def win_game(player)
    puts "#{player.name} WINS!"
    exit
  end

  def refresh_display
    puts "_________"
    x = 0
    while x < 9
      puts @space_array[x].get_space_icon + " | " + @space_array[x + 1].get_space_icon + " | " + @space_array[x +2].get_space_icon
      x += 3
    end
  end
end

game = Game.new


# Space testing
#
# space1 = BoardSpace.new
# puts space1.get_space_icon #should be 1
# space1.set_space_icon("X")
# puts space1.get_space_icon #should be X
# end testing
