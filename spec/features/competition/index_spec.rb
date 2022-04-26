


require 'rails_helper'

describe 'competitions index' do
  before do
    @comp1 = Competition.create!(name: 'comp', location: 'Denver', sport: 'tennis')
    @comp2 = Competition.create!(name: 'comp2', location: 'Boulder', sport: 'Basketball')
    visit "/competitions"
  end

  describe 'display' do
    describe 'names of all competitions' do
      it 'each name links to its show page' do
        within("competitions") do
          click_link @comp1.name
          expect(current_path).to eq("/competition/#{@comp1.id}")
        end
      end
    end
  end

