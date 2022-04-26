require "rails_helper"

RSpec.describe Competition, type: :model do
  describe "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:location) }
    it { should validate_presence_of(:sport) }
  end

  describe "relationships" do
    it { should have_many(:competition_teams) }
    it { should have_many(:teams).through(:competition_teams) }
    it { should have_many(:players).through(:teams) }
  end

  describe "class methods" do
    it "displays average age of players in a competition" do
      player1 = team1.players.create!(name: "Joe", age: 23)
      player2 = team1.players.create!(name: "Sam", age: 15)
      player3 = team2.players.create!(name: "Mike", age: 22)
      player4 = team3.players.create!(name: "Mia", age: 40)

      expect(competition.avg_player_age).to eq(25)
    end
  end
end
