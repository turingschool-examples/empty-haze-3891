require 'rails_helper'

RSpec.describe 'Competition Edit Page' do
  describe 'Competition Edit' do
    it 'has a form and text fields to fill out team attributes' do
      competition_1 = Competition.create!(name: 'Flight Fest', location: 'San Diego', sport: 'Basketball')
      team_1 = competition_1.teams.create!(nickname: 'Mild', hometown: 'Detroit')
      team_2 = competition_1.teams.create!(nickname: 'Hot', hometown: 'Atlanta')

      visit "/competitions/#{competition_1.id}/edit"
      fill_in :nickname, with: "Ice Ice Baby"
      fill_in :hometown, with: "Jersey"
      click_button 'Submit'

      expect(current_path).to eq("/competitions/#{competition_1.id}")
    end
  end
end
