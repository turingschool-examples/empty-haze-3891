require "rails_helper"

RSpec.describe "Competition Index Page" do
  it "displays name of all competitions" do
    competition1 = Competition.create!(name: "Mens Regional", location: "Louisville", sport: "Basketball")
    competition2 = Competition.create!(name: "Womens Semi", location: "Denver", sport: "Softball")
    competition3 = Competition.create!(name: "Youths Local", location: "Steamboat", sport: "Soccer")

    visit competitions_path

    expect(page).to have_content(competition1.name)
    expect(page).to have_content(competition2.name)
    expect(page).to have_content(competition3.name)
  end
end
