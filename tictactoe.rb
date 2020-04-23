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

    generate_board
    refresh_display
    new_turn
  end

  # TODO: we are going to work on this.
  public
  def new_turn
    puts " #{@player_1.name}, - enter a space number"
    choice = gets.to_i
    set_space_icon(choice -1, @player_1.icon)

    puts " #{@player_2.name}, - enter a space number"
    choice = gets.to_i
    set_space_icon(choice -1, @player_2.icon)

    new_turn
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

  def set_space_icon(index, icon)
    @space_array[index].set_space_icon(icon)
    refresh_display
    check_for_win
  end

  def check_for_win
   win_cond= [ [0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6] ]

   win_cond.each do |condidion|
     puts "X wins!" if condidion.all? { |cell| @space_array[cell].get_space_icon=="X" }
     puts "O wins!" if condidion.all? { |cell| @space_array[cell].get_space_icon=="O" }
   end
   #
   # # imperative for
   # for i in [1,2,3] do
   #   puts i
   # end
   #
   # # functional each
   # [1,2,3].each { |i| puts i }

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

#
#
# 1:
# +1
# +3
#
# 2:
# -1
# +1
# +3
#
# 3:
# -1
# +3
#
# 4:
# -3
# +1
# +3
#
# 5:
# -1
# +1
# -3
# +3
#
# 6:
