require_relative '../game'
require 'date'

describe Game do
  context 'when the game is not archived' do
    archived = true
    multiplayer = true
    last_played_at = 2018
    name = 'Super Mario'
    publish_date = Date.parse('2018-01-01')
    game = Game.new(name, multiplayer, last_played_at, archived, publish_date)
    it 'should not be archived' do
      expect(game.archived).to eq(true)
    end
    it 'should create a new game' do
      expect(game).to be_an_instance_of(Game)
    end
  end
end
