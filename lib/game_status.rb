# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],  # Middle row
  [6,7,8],  # Bottom row

  [0,3,6],  # Left column
  [1,4,7],  # Middle column
  [2,5,8],  # Right column

  [0,4,8],  # Top-Left cross
  [6,4,2]  # Bottom-Left cross
]

# returns true if the board has not been won but is full, false if the board is not won and the board is not full, and false if the board is won.

def draw?(board)
  if full?(board) && !won?(board)
    true
  else
    false
  end
end

def empty?(board)
  board.select{|cell| cell == ' '}.length == 9
end

def full?(board)
  board.select{|cell| cell == 'X' || cell == "O"}.length == 9
end

def won?(board)
  # The winning combo
  winning_combo = nil

  # Detect if board is empty
  if empty?(board)
    return false
  end

  # Detect if game has been won
  WIN_COMBINATIONS.each do |combo|

    cell_1 = combo[0]; cell_2 = combo[1]; cell_3 = combo[2]

    # If first position is empty, move to next combo immediately
    if !position_taken?(board, combo[0])
      next
    end

    # If the cells match
    cells_match = board[cell_1] == board[cell_2] && board[cell_1] == board[cell_3]

    # If first cell is X or O
    first_is_valid = board[cell_1] == "X" || board[cell_1] == "O"

    if first_is_valid && cells_match
      winning_combo = combo
      break
    end

  end

  return winning_combo != nil ? winning_combo : false
end

# board = ["X", "X", "X", "O", "O", " ", " ", " ", " "]
# puts won?(board);
