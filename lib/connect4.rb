# create board
class Connect4
  attr_accessor :board

  def initialize()
    @board = Array.new(7) {Array.new()}
  end

  # def play(player)
  def play(column, player)
    @board[column].push(player)
  end
  # check if finished

  def is_finished?()
    # board is full
    return true if @board.all? {|col| col.length == 6}

    # last player won
    7.times do |col|
      6.times do |row|
        return true if check_point?(@board, col, row)
      end
    end
    false
  end

  def check_point?(arr, col, row)
    return false if arr[col][row].nil?

    col_lens = (row <= 2) ? [arr[col][row], arr[col][row + 1], arr[col][row + 2], arr[col][row + 3]] : []
    row_lens = (col <= 3) ? [arr[col][row], arr[col + 1][row ], arr[col + 2][row], arr[col + 3][row]] : []
    anti_diag_lens = (row > 2 && col >= 3) ? [arr[col][row], arr[col - 1][row - 1], arr[col - 2][row - 2], arr[col - 3][row - 3]] : []
    diag_lens = (row > 2 && col <= 3) ? [arr[col][row], arr[col + 1][row + 1], arr[col + 2][row + 2], arr[col + 3][row + 3]] : []
    return true if row_lens.uniq.size == 1
    return true if col_lens.uniq.size == 1
    return true if anti_diag_lens.uniq.size == 1
    return true if diag_lens.uniq.size == 1

    false
  end

  def display_board()
    p '0 1 2 3 4 5 6'
    temp_row = []
    (0...6).reverse_each do |row|
      7.times do |col|
        token =  @board[col][row]
        token = token.nil? ? '*' : token
        temp_row.push(token)
      end
      p "#{temp_row.join(' ')}"
      temp_row = []
    end
  end
end

# create game
game = Connect4.new
turn = 1
puts 'New game! Player 1 please enter the column you want to play.'
until game.is_finished?
  col_play = gets.chomp.to_i
  game.play(col_play, turn)
  system('clear')
  game.display_board
  turn = turn == 1 ? 2 : 1
  puts "It is #{turn} turn to play"
end
turn = turn == 1 ? 2 : 1
puts "game ended! Winner is: #{turn}"
