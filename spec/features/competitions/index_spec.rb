require 'rails_helper'

RSpec.describe 'Competition Index Page' do
  describe 'Competition Index' do
    it 'displays names of all competitions as links to show page' do
      competition_1 = (name: 'Flight Fest', location: 'San Diego', sport: 'Basketball')
      competition_2 = (name: 'Jump City', location: 'Brooklyn', sport: 'Basketball')
      competition_3 = (name: 'Hot Shot', location: 'Tampa', sport: 'Soccer')

      visit '/competitions'
      click_link 'Flight Fest'
      expect(current_path).to eq("/competitions/#{competition_1.id}")

      visit '/competitions'
      click_link 'Jump City'
      expect(current_path).to eq("/competitions/#{competition_2.id}")

      visit '/competitions'
      click_link 'Hot Shot'
      expect(current_path).to eq("/competitions/#{competition_3.id}")
    end
  end
end
