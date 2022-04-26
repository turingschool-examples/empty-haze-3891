require 'rails_helper'

RSpec.describe 'Competition Index Page' do
  describe 'As a user when I visit the competition index page' do
    it 'Then I see the names of all competitions' do
      comp1 = Competition.create!(name: 'name1', location: 'location1', sport: 'sport1')
      comp2 = Competition.create!(name: 'name2', location: 'location2', sport: 'sport2')
      comp3 = Competition.create!(name: 'name3', location: 'location3', sport: 'sport3')

      visit '/competitions'

      expect(page).to have_content(comp1.name)
      expect(page).to have_content(comp2.name)
      expect(page).to have_content(comp3.name)
    end
  end
end