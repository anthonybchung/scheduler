require "rails_helper"

RSpec.feature "Create a Roster Name" do
  scenario "user enters a new Roster name" do
    visit new_roster_path

    fill_in "Roster Name", with: "CSELR25"

    click_button "Submit"

    expect(page).to have_content("CSELR25")
  end
end
