require "rails_helper"

RSpec.describe Roster, type: :model do
  it "is valid with a name" do
    roster = Roster.new(name: "CSELR2025")
    expect(roster).to be_valid
  end

  it "is not valid when the name is null" do
    roster = Roster.new(name: "")
    expect(roster).not_to be_valid
  end

  it "is not valid when there is the same name in the database" do
    roster = Roster.new(name: "CSELR2025")
    roster.save
    duplicate= Roster.new(name: "CSELR2025")
    expect(duplicate).not_to be_valid
  end
end
