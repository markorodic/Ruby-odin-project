require 'connect_four'

describe ConnectFour do

	let(:game) {ConnectFour.new}

	describe '#initialize' do
		it "creates a new board" do
			expect(game.board).to eq([[],[],[],[],[],[],[]])
		end
	end

	describe 'Board' do

		describe '#initialize' do
			it "creates a new board" do
				expect(game.board).to eq([[],[],[],[],[],[],[]])
			end
		end

		describe '#add_to_board' do
				it 'add first piece to a column' do
					game.add_to_board(1,"X")
					expect(game.board).to eq([["X"],[],[],[],[],[],[]])
				end

				it 'add nth piece to a column' do
					game.add_to_board(1,"X")
					game.add_to_board(1,"X")
					expect(game.board).to eq([["X", "X"],[],[],[],[],[],[]])
				end

				it 'invalid move attempt' do
					7.times do
						game.add_to_board(1,"X")
					end
					expect(game.add_to_board(1,"X")).to eq("Column 1 is full, choose another!")
				end
		end

		# describe "four_in_a_row?" do
		# 	xit 'returns true if four identical pieces vertical' do
		# 		3.times do
		# 			game.play(1)
		# 			game.play(2)
		# 		end
		# 		game.play(1)
		# 		expect(game.four_in_a_row?).to be true
		# 	end

		# 	xit 'returns true if four identical pieces horizontal' do
		# 		i=1
		# 		3.times do
		# 			game.play(i)
		# 			game.play(i)
		# 			i+=1
		# 		end
		# 		game.play(4)
		# 		# p game.board
		# 		expect(game.four_in_a_row?).to be true
		# 	end

		# 	xit 'returns true if four identical pieces diagonal' do
		# 		game.play(1)
		# 		game.play(2)
		# 		game.play(2)
		# 		game.play(3)
		# 		game.play(4)
		# 		game.play(3)
		# 		game.play(3)
		# 		game.play(4)
		# 		game.play(4)
		# 		game.play(5)
		# 		game.play(4)
		# 		# p game.board
		# 		expect(game.four_in_a_row?).to be true
		# 	end
		# end

	end

	describe '#play' do
		context 'make a move' do
			it 'allows player to choose a position to move' do
				# allow($stdin).to receive(:gets).and_return(1)
				# input = $stdin.gets
				expect(game.play(1)).to eq([["X"],[],[],[],[],[],[]])
			end
		end
	end

	describe 'Player' do

		describe '#which_player' do

			it 'player 1 returns X at the start' do
				game.play(1)
				expect(game.which_player).to eq("X")
			end

			it 'returns O after 1 go' do
				2.times do
					game.play(3)
				end
				expect(game.which_player).to eq("O")
			end
		end

	end

end