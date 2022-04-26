require "rails_helper"

RSpec.describe "Competition Show Page" do
  it "displays competitions attributes" do
    competition1 = Competition.create!(name: "Mens Regional", location: "Louisville", sport: "Basketball")

    team1 = Team.create!(hometown: "Golden", nickname: "Spartans")
    team2 = Team.create!(hometown: "Frisco", nickname: "Trojans")
    team3 = Team.create!(hometown: "Arvada", nickname: "Wildcats")

    player1 = team1.players.create!(name: "Joe", age: 23)
    player2 = team1.players.create!(name: "Sam", age: 15)
    player3 = team2.players.create!(name: "Mike", age: 22)
    player4 = team3.players.create!(name: "Mia", age: 40)

    CompetitionTeam.create!(competition: competition1, team: team1)
    CompetitionTeam.create!(competition: competition1, team: team2)
    CompetitionTeam.create!(competition: competition1, team: team3)

    visit competitions_path(competition1.id)

    expect(page).to have_content(competition1.name)
    expect(page).to have_content(competition1.location)
    expect(page).to have_content(competition1.sport)
    expect(page).to have_content(competition1.sport)
    expect(page).to have_content(team1.nickname)
    expect(page).to have_content(team1.hometown)
    expect(page).to have_content(team2.nickname)
    expect(page).to have_content(team2.hometown)
    expect(page).to have_content(team3.nickname)
    expect(page).to have_content(team3.hometown)
    expect(page).to have_content("Average age of competition players: 25")
  end
end
