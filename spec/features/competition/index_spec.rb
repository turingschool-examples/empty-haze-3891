require 'rails_helper'

RSpec.describe 'Competition Index', type: :feature do
  before do
    @comp1 = Competition.create!(name: "Quarter_Finals", location: "City1", sport: "Chutes_and_Ladders")
    @comp2 = Competition.create!(name: "Semi_Finals", location: "City2", sport: "Turtle_Fights")
    @comp3 = Competition.create!(name: "Finals_Retake", location: "City3", sport: "High_Pressure_Pressurizing")

  visit "/competitions"
  end

  it 'shows the names of all competitions as links to their resective show page' do
    within("#competitions #{@comp1.id}") do
      click_link @comp1.name
       expect(current_path).to eq("/comp1/#{@comp1.id}")
     end

       visit "/competitions"
    within("#competitions #{@comp2.id}") do
      click_link @comp2.name
       expect(current_path).to eq("/comp2/#{@comp2.id}")
     end

       visit "/competitions"
    within("#competitions #{@comp3.id}") do
      click_link @comp3.name
       expect(current_path).to eq("/comp3/#{@comp3.id}")
     end
  end

end
