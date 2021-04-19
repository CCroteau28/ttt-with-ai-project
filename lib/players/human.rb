module Players
    class Human < Player
        
        def move(board)
            puts "What is your next move?"
            gets.strip
        end
    end
end