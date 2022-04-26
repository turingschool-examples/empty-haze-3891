require 'rails_helper'

RSpec.describe Team, type: :model do
  describe 'relationships' do
    it { should have_many :players }
    it { should have_many :competitions }
  end

  describe 'instance methods' do
    it 'calculates average age of players' do
      competition_1 = Competition.create!(name: 'Flight Fest', location: 'San Diego', sport: 'Basketball')
      team_1 = competition_1.teams.create!(nickname: 'Mild', hometown: 'Detroit')
      andrew = team_1.players.create!(name: "Andrew", age: 1)
      tom = team_1.players.create!(name: "Tom", age: 2)
      jerry = team_1.players.create!(name: "Jerry", age: 6)

      expect(team_1.average_age).to eq(3)
    end
  end
end
