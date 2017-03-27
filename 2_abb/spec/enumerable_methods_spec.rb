require 'enumerable_methods'

describe 'Enumerable' do
	
	let(:multiple) {[1,2,3,4]}
	let(:single) {[1]}
	let(:test) {[]}

	describe 'my_each' do
		it 'sends each element of an array to the block' do
			multiple.my_each{|n| test << n}
			expect(test).to eq([1,2,3,4])
		end
	end

	describe 'my_each_with_index' do
		it 'applies both element and index ot the block' do
			multiple.my_each_with_index{|a, b| test << a+b }
			expect(test).to eq([1,3,5,7])
		end
	end

	describe 'my_select' do
		it 'returns each element that is true for the block' do
			result = multiple.my_select {|a| a if a % 2 == 0}
			expect(result).to eq([2,4])
		end
	end

	describe 'my_all?' do
		it 'returns true if all element satisfy the condition in the block' do
			result = multiple.my_all? {|a, b| a < 5 }
			expect(result).to eq(true)
		end

			it 'returns false if any element does not satisfy the condition in the block' do
			result = multiple.my_all? {|a, b| a < 2 }
			expect(result).to eq(false)
		end
	end

	describe 'my_any?' do
		it 'returns true if any of the elements satisfy the condition in the block' do
			result = multiple.my_any? {|a, b| a < 2 }
			expect(result).to eq(true)
		end

		it 'returns false if every element does not satisfy the condition in the block' do
			result = multiple.my_any? {|a, b| a > 4 }
			expect(result).to eq(false)
		end
	end

	describe 'my_none?' do
		it 'returns true if none of the elements satisfy the condition in the block' do
			result = multiple.my_any? {|a, b| a < 2 }
			expect(result).to eq(true)
		end

		it 'returns false if every element does not satisfy the condition in the block' do
			result = multiple.my_any? {|a, b| a > 4 }
			expect(result).to eq(false)
		end
	end

	describe 'my_count' do
		context 'if no block or arguement is given'
			it 'returns the number of the elements' do
				result = multiple.my_count
				expect(result).to eq(4)
			end

		context 'if an arguement is given'
			it 'returns the number of the elements that equal the arguement' do
				result = multiple.my_count(2)
				expect(result).to eq(1)
			end

		context 'if an arguement and block are given'
		it 'returns the number of the elements that equal the arguement' do
			result = multiple.my_count(2) {|a| a%2 == 0}
			expect(result).to eq(1)
		end

		context 'if a block is given'
			it 'returns the number of the elements that staisfy the condition in the block' do
				result = multiple.my_count {|a| a%2 == 0}
				expect(result).to eq(2)
			end
	end

	describe 'my_map' do
		context "when a block is given" do 
			it "steps through each item in array and do block" do
				result = multiple.my_map { |item| item * 2 }
				expect(result).to eq([2,4,6,8])
			end
		end

		context "when a proc is given" do 
			it "steps through each item in array and do proc" do 
				my_proc = Proc.new { |x| x + 3 }
				result = multiple.my_map(&my_proc)
				expect(result).to eq([4,5,6,7])
			end
		end
	end

	describe 'my_inject' do
		context "when no arguement is given" do 
			it "sends each item to the block and return the result" do
				result = multiple.my_inject {|a,b| a+b}
				expect(result).to eq(10)
			end
		end

		context "when an arguement is given" do 
			it "sends each item to the block and return the result, using the argument as the " do 
				result = multiple.my_inject(2) {|a,b| a+b}
				expect(result).to eq(12)
			end
		end
	end

	describe 'multiply_els' do
		it "multiplies all numbers in the array" do
			result = multiple.multiply_els
			expect(result).to eq(24)
		end
	end
end