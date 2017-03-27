require 'tictactoe.rb'

describe Game do

	let(:board) {Board.new}

	describe '#is_it_a_winning_game?' do

		it "three in a row" do
			board.score = ["x", "x", "x", 4, 5, 6, 7, 8, 9]
			expect(board.is_it_a_winning_game?).to be(true)
		end

		it "three in a line" do
			board.score = ["x", 2, 3, "x", 5, 6, "x", 8, 9]
			expect(board.is_it_a_winning_game?).to be(true)
		end

		it "three diagonally" do
			board.score = ["x", 2, 3, 4, "x", 6, 7, 8, "x"]
			expect(board.is_it_a_winning_game?).to be(true)
		end
	end
	
	describe '#score' do
		it "creates a board" do
			expect(board.score).to eq([1,2,3,4,5,6,7,8,9])
		end
	end

	describe '#update_score' do
		it "updates the board" do
			board.update_score(1, "X")
			expect(board.score).to eq(["X",2,3,4,5,6,7,8,9])
		end
	end

	# describe 'draw the board'

	# end


	#a board
	#create players
	#prompts players to make a move
	#
	#recording a move
	#game ends
end