require 'rails_helper'

RSpec.describe 'competition index page' do
  before :each do
    @comp1 = Competition.create!(name: "Big 5", location: "Savannah", sport: "Baseball")
    @comp2 = Competition.create!(name: "The Comp", location: "Dallas", sport: "Tennis")
    @comp3 = Competition.create!(name: "Grand Prix", location: "Reno", sport: "Racing")
  end

  it "displays the competition name" do
    visit "/competitions"

    expect(page).to have_content(@comp1.name)
    expect(page).to have_content(@comp2.name)
    expect(page).to have_content(@comp3.name)
  end

  it "has links to each competitions show page" do
    visit "/competitions"

    expect(page).to have_link(@comp1.name)
    expect(page).to have_link(@comp2.name)
    expect(page).to have_link(@comp3.name)

    click_link("#{@comp1.name}")
    expect(current_path).to eq("/competitions/#{@comp1.id}")
  end
end
