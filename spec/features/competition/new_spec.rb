require "rails_helper"

RSpec.describe "competition new form" do
  describe "new form" do
    it "has a form to add a team to competition" do
      competition1 = Competition.create!(name: "Mens Regional", location: "Louisville", sport: "Basketball")

      team1 = Team.create!(hometown: "Golden", nickname: "Spartans")

      visit competitions_path(competition1.id)

      expect(page).to_not have_content(team1.nickname)

      fill_in :team_id, with: team1.id
      click_on :submit

      expect(current_path).to eq(competitions_path(competition1.id))
      expect(page).to have_content(team1.nickname)
    end
  end
end
