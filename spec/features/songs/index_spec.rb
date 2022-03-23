require 'rails_helper'
# As a user,
# when I visit '/songs'
# I see each song's title and play count
RSpec.describe "songs index page", type: :feature do
  it "can see all songs titles and play count" do
    artist = Artist.create!(name: "Carly Rae Jepsen")
    song_1 = artist.songs.create!(title: "I really like you", length: 208, play_count: 234987)
    song_2 = artist.songs.create!(title: "Call Me Maybe", length: 234, play_count: 938755)

    visit "/songs"

    expect(page).to have_content(song_1.title)
    expect(page).to have_content("Play Count: #{song_1.play_count}")
    expect(page).to have_content(song_2.title)
    expect(page).to have_content("Play Count: #{song_2.play_count}")
  end
end