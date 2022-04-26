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

  it "competition names have link to their show page" do
    competition1 = Competition.create!(name: "Mens Regional", location: "Louisville", sport: "Basketball")
    competition2 = Competition.create!(name: "Womens Semi", location: "Denver", sport: "Softball")
    competition3 = Competition.create!(name: "Youths Local", location: "Steamboat", sport: "Soccer")

    team1 = Team.create!(hometown: "Golden", nickname: "Spartans")
    team2 = Team.create!(hometown: "Frisco", nickname: "Trojans")
    team3 = Team.create!(hometown: "Arvada", nickname: "Wildcats")

    visit competitions_path

    expect(page).to have_link("Mens Regional")
    expect(page).to have_link("Womens Semi")
    expect(page).to have_link("Youths Local")

    click_link "Mens Regional"

    expect(current_path).to eq(competition_path(competition1.id))
    expect(current_path).to_not eq(competition_path(competition2.id))
  end
end
