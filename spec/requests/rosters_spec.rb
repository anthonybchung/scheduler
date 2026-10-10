require "rails_helper"

RSpec.describe "Rosters", type: :request do
  describe "POST /rosters" do
    context "with a good name" do
      it "creates a roster and redirects to the show page of the created roster" do
        expect {
          post rosters_path, params: {roster:{name: "CSELR2026"}}
        }.to change(Roster,:count).by(1)

        expect(response).to redirect_to(roster_path(Roster.last))
      end
    end

    context "receives a duplicate name" do
      before {Roster.create!(name: "CSELR2026")}

      it "does not create a new roster row and re-renders page new" do
        expect {
          post rosters_path, params: {roster:{name: "CSELR2026"}}
        }.not_to change(Roster, :count)

        expect(response).to have_http_status(:unprocessable_content)
        expect(response.body).to include("Name has already been taken")
      end
    end

    context "recieves a blank name" do
      it "does not create a new roster and re-renders page new" do
        expect {
          post rosters_path, params: {roster:{name: ""}}
        }.not_to change(Roster, :count)

        expect(response).to have_http_status(:unprocessable_content)
        expect(response.body).to include("Name can NOT be blank")
      end
    end
  end
end
