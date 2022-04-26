require 'rails_helper'

describe 'competition show' do
  before do
    @comp1 = Competition.create!(name: 'C1', location: 'L1', sport: 'BB2')
    @comp2 = Competition.create!(name: 'C2', location: 'L2', sport: 'BB2')
f
    @team1 = Team.create!(hometown: "Atown", nickname: "Aholes")
    @player1 = @team1.players.create!(name: "A", age: 10)
    @player2 = @team1.players.create!(name: "B", age: 12)
    @player3 = @team1.players.create!(name: "C", age: 13)

    @team2 = Team.create!(hometown: "Btown", nickname: "Bholes")
    @player4 = @team2.players.create!(name: "D", age: 21)
    @player5 = @team2.players.create!(name: "E", age: 22)
    @player6 = @team2.players.create!(name: "F", age: 2323)


    @comp_team1 = CompetitionTeam.create!(competition_id: @comp1.id, team_id: @team1.id)
    @comp_team2 = CompetitionTeam.create!(competition_id: @comp1.id, team_id: @team2.id)
    @comp_team3 = CompetitionTeam.create!(competition_id: @comp2.id, team_id: @team2.id)
    visit "/competition/#{@comp1.id}"
    end

  describe 'display' do
    it 'competition name, location, and sport' do
      expect(page).to have_content(@comp1.name)
      expect(page).to have_content(@comp1.location)
      expect(page).to have_content(@comp1.sport)
      expect(page).to_not have_content(@comp2.name)
    end

    it 'competition team names and hometown' do
      expect(page).to have_content(@team1.nickname)
      expect(page).to have_content(@team1.hometown)
      expect(page).to have_content(@team2.nickname)
      expect(page).to have_content(@team2.hometown)
      expect(page).to_not have_content(@team3)
    end

    it 'average age of all players in the competition' do
      expect(page).to have_content("Average age of all players: #{@comp1.average_age}")
    end

    it 'link to register a new team' do
      click_link 'Register New Team'
      expect(current_path).to eq("/competitions/#{@comp1.id}/teams/new")
    end
  end
end
