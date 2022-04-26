require 'rails_helper'

describe Team, type: :model do
  describe 'validations' do
    it { should validate_presence_of :nickname }
    it { should validate_presence_of :hometown }
  end


  describe 'relationships' do
    it { should have_many :players }
    it { should have_many :team_competitions }
    it { should have_many(:competitions).through(:team_competitions ) }
  end

  describe 'methods' do
    before do
      @comp_1 = Competition.create!(
        name: "Something",
        location: "Here",
        sport: "BallSport"
      )
      @team_4 = Team.create!(
        nickname: "This",
        hometown: "Town1"
      )
      @player_1 = @team_4.players.create!(
        name: "Jack",
        age: "24"
      )
      @player_2 = @team_4.players.create!(
        name: "Scotty",
        age: "32"
      )

      @team_2 = Team.create!(
        nickname: "That",
        hometown: "Town3"
      )
      @player_3 = @team_2.players.create!(
        name: "John",
        age: "22"
      )
      @player_4 = @team_2.players.create!(
        name: "Noah",
        age: "30"
      )

      @comp_2 = Competition.create!(
        name: "Other Thing",
        location: "There",
        sport: "Sportsball"
      )

      @team_1 = Team.create!(
        nickname: "Yes",
        hometown: "Town4"
      )
      @player_5 = @team_1.players.create!(
        name: "Susan",
        age: "19"
      )
      @player_6 = @team_1.players.create!(
        name: "Cory",
        age: "23"
      )

      @team_3 = Team.create!(
        nickname: "No",
        hometown: "Town2"
      )
      @player_7 = @team_3.players.create!(
        name: "Scott",
        age: "29"
      )
      @player_8 = @team_3.players.create!(
        name: "Ben",
        age: "44"
      )

      @team_comp_1 = TeamCompetition.create!(competition_id: @comp_1.id, team_id: @team_4.id)
      @team_comp_2 = TeamCompetition.create!(competition_id: @comp_1.id, team_id: @team_2.id)
    end

    it '#avg_player_age' do
      expect(@team_1.avg_player_age).to eq(21)
      expect(@team_2.avg_player_age).to eq(26)
      expect(@team_3.avg_player_age).to eq(36)
      expect(@team_4.avg_player_age).to eq(28)
    end
  end
end