module Players
    class Computer < Player

        WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [6,4,2]]

        def move(board)
            valid_positions = ["5", "1", "9", "2", "8", "3", "7", "4", "6"]
            valid_positions.shuffle!
            valid_positions.find do |move|
                board.valid_move?(move)
            end
        end
    end
end