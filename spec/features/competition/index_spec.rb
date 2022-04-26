require 'rails_helper'

RSpec.describe 'Competition Index' do
  it 'Displays competitions' do
    competition1 = Competition.create!(name:"This Competition", location: "USA", sport: "Basketball")
    team1 = Team.create!(nickname:"Wildcats", hometown:"Chicago")
    competitionteam1 = CompetitionTeam.create!(competition: competition1, team: team1)

    visit competitions_path

    expect(page).to have_link(competition1.name)
    click_link "#{competition1.name}"

    expect(current_path).to eq(competition_path(competition1))
  end

end
