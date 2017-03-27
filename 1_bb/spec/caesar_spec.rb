require 'caesar'

# test keys
# test keys over 26
# test non alpha text
# test uppercase letters
# test lowercase letters



describe 'caesar_cipher' do
	it 'returns a string with a given key' do
		caesar = caesar_cipher("abc", 2)
		expect(caesar).to eq("Cde")
	end
end

describe 'caesar_cipher' do
	it 'accepts a key of 0' do
		caesar = caesar_cipher("abc", 0)
		expect(caesar).to eq("Abc")
	end
end

describe 'caesar_cipher' do
	it 'accepts a key larger than 26' do
		caesar = caesar_cipher("abc", 28)
		expect(caesar).to eq("Cde")
	end
end

describe 'caesar_cipher' do
	it 'warps characters' do
		caesar = caesar_cipher("atz", 2)
		expect(caesar).to eq("Cvb")
	end
end

describe 'caesar_cipher' do
	it 'shifts alpha chars only' do
		caesar = caesar_cipher("6998!@^&$", 28)
		expect(caesar).to eq("6998!@^&$")
	end
end

describe 'caesar_cipher' do
	it 'capitalizes an input' do
		caesar = caesar_cipher("ABC", 5)
		expect(caesar).to eq("Fgh")
	end
end