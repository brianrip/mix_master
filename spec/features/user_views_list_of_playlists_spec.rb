require 'rails_helper'

RSpec.feature "User can view index of playlists" do
  scenario "playlist link takes user to the individual playlist to view songs" do

    playlist = create(:playlist)
    playlist2 = Playlist.create(name: "Blues")
    playlist2.songs.create(title: "Luckiest Man")

    visit playlists_path

    find_link("MyString").visible?
    find_link("Blues").visible?

    click_link("Blues")

    expect(page).to have_content("Luckiest Man")
    save_and_open_page
    
  end
end
