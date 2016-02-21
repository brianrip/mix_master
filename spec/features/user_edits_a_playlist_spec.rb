# require 'rails_helper'
# # As a user
# # Given that a playlist and songs exist in the database
# # When I visit that playlist's show page
# # And I click on "Edit"
# # And I enter a new playlist name
# # And I select an additional song
# # And I uncheck an existing song
# # And I click on "Update Playlist"
# # Then I should see the playlist's updated name
# # And I should see the name of the newly added song
# # And I should not see the name of the removed songs
#
# RSpec.feature "User can edit a playlist" do
#   scenario "User changes name of playlist and adds or removes a song" do
#
#     playlist = Playlist.create(name: "Country")
#     playlist.songs.create(title: "Rodeo")
#     playlist.songs.create(title: "In Color")
#     Song.create(title: "Wagon Wheel")
#
#     visit playlist_path(playlist.id)
#
#     click_on "Edit"
#
#     fill_in "Playlist name", with: "Rock"
#
#
#
#
#   end
# end

require 'rails_helper'

RSpec.feature "User edits an existing playlist" do
  scenario "they see the updated data for the individual playlist" do
    playlist             = create(:playlist_with_songs)
    first, second, third = playlist.songs
    new_song             = create(:song, title: "New Song")

    visit playlist_path(playlist)
    click_on "Edit"
    uncheck("song-#{first.id}")
    check("song-#{new_song.id}")
    click_on "Update Playlist"

    expect(page).to have_content playlist.name
    expect(page).to_not have_content first.title
    expect(page).to have_content new_song.title
  end
end
