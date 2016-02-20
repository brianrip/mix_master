require 'rails_helper'
# as a user
# given that a artist exists in the db
# when I visit that artists show page
# And i click delete
# Then I should be ba rerouted back to the index
# and I should not see the link for that artist#
RSpec.feature "User can delete an artist" do
  scenario "User visits artist page and deletes that artist" do

    bob = Artist.create(name: "Bob Marley",
                  image_path: "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg")

    visit artist_path(bob.id)
    expect(page).to have_content "Bob Marley"

    click_link('Delete')

    expect(page).to have_content "All Artists"
    expect(page).to_not have_content "Bob Marley"
  end
end
