class Game
    attr_accessor :board, :player_1, :player_2

    WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [6,4,2]]
    
    def initialize (player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
        @player_1 = player_1
        @player_2 = player_2
        @board = board
    end

    def current_player
        @board.turn_count.even? ? @player_1 : @player_2
    end

    def won?
        WIN_COMBINATIONS.find do |combo|
            @board.cells[combo[0]] == @board.cells[combo[1]] &&
            @board.cells[combo[1]] == @board.cells[combo[2]] &&
            @board.taken?(combo[0]+1)
        end
    end

    def draw?
        @board.full? && !won?
    end

    def over?
        draw? || won?
    end

    def winner
        if combo_won = won?
            @winner = @board.cells[combo_won.first]
        end
    end

    def turn
        make_a_move = current_player.move(@board)
        if @board.valid_move?(make_a_move)
            @board.update(make_a_move, current_player)
            @board.display
        else
            turn
        end
    end

    def play
        while !over?
            turn
        end
        if won?
            puts "Congratulations #{winner}!"
        elsif draw?
            puts "Cat's Game!"
        end
    end

    def start
        puts "Welcome witches and wizards to a game of Tic Tac Toe with AI! Are you the chosen one, smart enough to beat this game? Play and see!"
        play
        @board.display
    end
end