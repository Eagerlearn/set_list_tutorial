require 'rails_helper'

RSpec.describe 'the songs show page' do
  # As a visitor
  # When I visit /songs/1 (where 1 is the id of the song in my db)
  # Then I see that song's title, and artist
  # And I do not see any of the other songs in my db
  it 'displays the song title' do
    artist = Artist.create!(name: "Carly Rae Jepsen")
    song_1 = artist.songs.create!(title: "I really like you", length: 208, play_count: 234987)
    song_2 = artist.songs.create!(title: "Call Me Maybe", length: 234, play_count: 938755)
    visit "/songs/#{song_1.id}"

    expect(page).to have_content(song_1.title)
    expect(page).to_not have_content(song_2.title)
  end

  it 'displays the name of the artist for the song' do
    artist = Artist.create!(name: "Carly Rae Jepsen")
    song_1 = artist.songs.create!(title: "I really like you", length: 208, play_count: 234987)
    song_2 = artist.songs.create!(title: "Call Me Maybe", length: 234, play_count: 938755)
    visit "/songs/#{song_1.id}"

    expect(page).to have_content(artist.name)
  end
end