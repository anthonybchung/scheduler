require "rails_helper"

RSpec.feature "Create a Roster Name" do
  scenario "user enters a new Roster name" do
    visit new_roster_path

    fill_in "Roster Name", with: "CSELR25"

    click_button "Submit"

    expect(page).to have_content("CSELR25")
  end

  scenario "user enters a new Roster name and redirect to show.html.erb" do
    visit new_roster_path

    fill_in "Roster Name", with: "CSELR2026"

    click_button "Submit"
    roster = Roster.find_by!(name: "CSELR2026")
    expect(page).to have_current_path(roster_path(roster))
    expect(page).to have_content("CSELR2026")
  end
end


