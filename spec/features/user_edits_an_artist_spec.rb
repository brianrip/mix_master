require 'rails_helper'
#   as a user
#   given taht the artist is in the db
# when i visit the artists show page
#   and I click edit
#   and I fill in a new name
#   and I click "Update Artist"
#   Then I should see the artist updated name
#   then I should see the existing image
  RSpec.feature "User can edit an artist name" do
    scenario "they see the page for the individual artist and click edit" do

      bob = Artist.create(name: "Bob Marley", image_path: "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg")
      visit artist_path(bob.id)
      click_on "Edit"
      fill_in "artist_name", with: "Bon Jovi"
      fill_in "artist_image_path", with: bob.image_path
      click_on "Update Artist"
      expect(page).to have_content "Bon Jovi"
      expect(page).to have_css("img[src=\"#{bob.image_path}\"]")
    end
  end
