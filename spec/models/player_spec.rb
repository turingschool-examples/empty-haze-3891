require 'rails_helper'

RSpec.describe Player, type: :model do
  describe 'relationships' do
    it { should belong_to :team }
    it { should have_many(:team_competitions).through(:team)}
    it { should have_many(:competitions).through(:team_competitions)}
  end

  describe 'class methods' do
    it 'can return the average age of all players' do

      comp1 = Competition.create!(name: 'name1', location: 'location1', sport: 'sport1')
      comp2 = Competition.create!(name: 'name2', location: 'location2', sport: 'sport2')

      team1 = Team.create!(nickname: 'nickname1', hometown: 'hometown1')
      team2 = Team.create!(nickname: 'nickname2', hometown: 'hometown2')
      team3 = Team.create!(nickname: 'nickname3', hometown: 'hometown3')

      player1 = team1.players.create!(name: 'jane', age: 20)
      player2 = team1.players.create!(name: 'joan', age: 30)
      player3 = team2.players.create!(name: 'jack', age: 40)
      player4 = team2.players.create!(name: 'jill', age: 10)
      player5 = team3.players.create!(name: 'joe', age: 50)


      tc1 = TeamCompetition.create!(team: team1, competition: comp1)
      tc2 = TeamCompetition.create!(team: team2, competition: comp1)
      tc3 = TeamCompetition.create!(team: team3, competition: comp2)

      expect(Player.average_player_age).to eq(30)
    end
  end


end