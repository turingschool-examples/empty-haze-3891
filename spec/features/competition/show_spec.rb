require 'rails_helper'

RSpec.describe 'Competition Show' do
  it 'Displays competition' do
    competition1 = Competition.create!(name:"This Competition", location: "USA", sport: "Basketball")
    team1 = Team.create!(nickname:"Wildcats", hometown:"Chicago")
    competitionteam1 = CompetitionTeam.create!(competition: competition1, team: team1)

    visit competition_path(competition1)

    expect(page).to have_content(competition1.name)
    expect(page).to have_content(competition1.location)
    expect(page).to have_content(competition1.sport)

  end
end
