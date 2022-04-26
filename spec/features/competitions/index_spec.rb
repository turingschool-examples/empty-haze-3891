require 'rails_helper'

describe 'competition show page', type: :feature do
  before do
    @comp_1 = Competition.create!(
      name: "Something",
      location: "Here",
      sport: "BallSport",)

      @comp_2 = Competition.create!(
      name: "Other Thing",
      location: "There",
      sport: "Sportsball",)

      visit competitions_path
  end

  describe 'display' do
    it 'shows all competitions' do
      within "#competitions" do
        within "#competition-#{@comp_1.id}" do
          expect(page).to have_content("Something")
          expect(page).not_to have_content("NonFiction")
        end

        within "#competition-#{@comp_2.id}" do
          expect(page).to have_content("Other Thing")
          expect(page).not_to have_content("NonFiction")
        end
      end
    end

    it 'has a link to comp show page' do
      within "#competition-#{@comp_1.id}" do
        expect(page).to have_link("Something")
        expect(page).not_to have_link("Other Thing")
      end

      click_link("Something")
      expect(current_path).to eq(competitions_path(@comp_1))
      expect(current_path).to_not eq(competitions_path(@comp_2))
    end
  end
end