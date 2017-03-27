require 'game'
require 'player'

describe Game do
	it 'creates an instance of Game' do
		expect(Game.new).to be_an_instance_of Game
	end

	it 'creates an instance variable of player' do
		expect(Game.new.player_one).to be_an_instance_of Player
	end

	it 'creates an instance variable of player' do
		expect(Game.new.player_two).to be_an_instance_of Player
	end

	it 'creates an instance variable of '

end