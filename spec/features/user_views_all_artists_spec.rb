require 'rails_helper'

  RSpec.feature "User views all artists" do
    scenario "they see a list of all artists as links" do

    rob = Artist.create(name: "Rob Zombie", image_path: "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg")
    bob = Artist.create(name: "Bob Marley", image_path: "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg")

    visit artists_path

    find_link('Rob Zombie').visible?
    find_link('Bob Marley').visible?
    expect(page).to have_content "Rob Zombie"
    expect(page).to have_content "Bob Marley"
  end
end
# As a user
# Given that artist exists in the database
# when i visit the artist index
# then I should see the artists name
# each arist name should be a link that allows user to view artists individual page
