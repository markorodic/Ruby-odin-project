require 'board'

describe Board do

	let(:board) {Board.new}

	it "creates a new board" do
		expect(board.grid).to eq([[],[],[],[],[],[],[]])
	end

	describe '#add_to_board' do
		it 'add first piece to a column' do
			board.add_to_board(1,"X")
			expect(board.grid).to eq([["X"],[],[],[],[],[],[]])
		end

		it 'add nth piece to a column' do
			board.add_to_board(1,"X")
			board.add_to_board(1,"X")
			expect(board.grid).to eq([["X", "X"],[],[],[],[],[],[]])
		end

		it 'invalid move attempt' do
			7.times do
				board.add_to_board(1,"X")
			end
			expect(board.add_to_board(1,"X")).to eq("Column 1 is full, choose another!")
		end
	end

	context 'winning hands' do

		describe 'winning_columns' do
			it 'returns array with all possible winning combinations' do
				board.grid = [[1,2,3,4,5,6],[1,2,3,4,5,6],[1,2,3,4,5,6],[1,2,3,4,5,6],[1,2,3,4,5,6],[1,2,3,4,5,6],[1,2,3,4,5,6]]
				expect(board.winning_columns).to eq([[1,2,3,4],[2,3,4,5],[3,4,5,6],[1,2,3,4],[2,3,4,5],[3,4,5,6],[1,2,3,4],[2,3,4,5],[3,4,5,6],[1,2,3,4],[2,3,4,5],[3,4,5,6],[1,2,3,4],[2,3,4,5],[3,4,5,6],[1,2,3,4],[2,3,4,5],[3,4,5,6],[1,2,3,4],[2,3,4,5],[3,4,5,6]])
			end
		end

		describe 'winning_rows' do
			it 'returns array with all possible winning combinations' do
				board.grid = [[1,1,1,1,1,1],[2,2,2,2,2,2],[3,3,3,3,3,3],[4,4,4,4,4,4],[5,5,5,5,5,5],[6,6,6,6,6,6],[7,7,7,7,7,7]]
				expect(board.winning_rows).to eq([[1,2,3,4],[2,3,4,5],[3,4,5,6],[4,5,6,7],[1,2,3,4],[2,3,4,5],[3,4,5,6],[4,5,6,7],[1,2,3,4],[2,3,4,5],[3,4,5,6],[4,5,6,7],[1,2,3,4],[2,3,4,5],[3,4,5,6],[4,5,6,7],[1,2,3,4],[2,3,4,5],[3,4,5,6],[4,5,6,7],[1,2,3,4],[2,3,4,5],[3,4,5,6],[4,5,6,7]])
			end
		end

		describe 'winning_diagonals' do
			it 'returns array with all possible winning combinations' do
				board.grid = [[1,2,3,4,5,6],[7,8,9,10,11,12],[13,14,15,16,17,18],[19,20,21,22,23,24],[25,26,27,28,29,30],[31,32,33,34,35,36],[37,38,39,40,41,42]]
				expect(board.winning_diagonals).to eq([[19,14,9,4],[20,15,10,5],[21,16,11,6],[25,20,15,10],[26,21,16,11],[27,22,17,12],[31,26,21,16],[32,27,22,17],[33,28,23,18],[37,32,27,22],[38,33,28,23],[39,34,29,24]])
			end
		end

	end

	describe 'four_in_a_row?' do
			it 'returns true if four identical pieces vertical' do
				4.times do
					board.add_to_board(1,"X")
				end
				expect(board.four_in_a_row?).to be true
			end

			it 'returns true if four identical pieces horizontal' do
				x = 1
				4.times do
					board.add_to_board(x,"X")
					x += 1
				end
				expect(board.four_in_a_row?).to be true
			end

			it 'returns true if four identical pieces diagonal' do
				board.add_to_board(1,"X")
				board.add_to_board(2,"G")
				board.add_to_board(2,"X")
				board.add_to_board(3,"A")
				board.add_to_board(3,"B")
				board.add_to_board(3,"X")
				board.add_to_board(4,"A")
				board.add_to_board(4,"B")
				board.add_to_board(4,"F")
				board.add_to_board(4,"X")
				expect(board.four_in_a_row?).to be true
			end
		end

end