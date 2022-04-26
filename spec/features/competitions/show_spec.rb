require 'rails_helper'

RSpec.describe 'Competition Show Page' do
  describe 'As user when I visit a competition show page' do
    it 'Then I see the competitions name, location, and sport' do
      comp1 = Competition.create!(name: 'name1', location: 'location1', sport: 'sport1')
      comp2 = Competition.create!(name: 'name2', location: 'location2', sport: 'sport2')

      visit "/competitions/#{comp1.id}"

      expect(page).to have_content("#{comp1.name}")
      expect(page).to have_content("#{comp1.location}")
      expect(page).to have_content("#{comp1.sport}")
      expect(page).to_not have_content("#{comp2.name}")
      expect(page).to_not have_content("#{comp2.location}")
      expect(page).to_not have_content("#{comp2.sport}")
    end
  end
end