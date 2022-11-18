require_relative '../music_genre_class/music_album'
require_relative '../item'

describe MusicAlbum do
  before(:each) do
    archived = true
    publish_date = Time.now
    name = 'music album'
    @music = MusicAlbum.new(archived, name, publish_date)
  end

  context 'Unit test for Music Album' do
    it 'Test for checking instance' do
      expect(@music).to be_an_instance_of(MusicAlbum)
    end

    it 'Test for checking name' do
      expect(@music.name).to eql 'music album'
    end

    it 'Test for checking publish_date type' do
      expect(@music.publish_date).to be_an_instance_of(Time)
    end
  end
end
