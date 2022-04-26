require 'rails_helper'

RSpec.describe Competition, type: :model do
  describe 'relationships' do
    it { should have_many :teams }
  end

  describe 'instance methods' do
    it 'calculates average age of competition' do
      competition_1 = Competition.create!(name: 'Flight Fest', location: 'San Diego', sport: 'Basketball')
      team_1 = competition_1.teams.create!(nickname: 'Mild', hometown: 'Detroit')
      team_2 = competition_1.teams.create!(nickname: 'Hot', hometown: 'Atlanta')
      andrew = team_1.players.create!(name: "Andrew", age: 5)
      tom = team_1.players.create!(name: "Tom", age: 5)
      jerry = team_1.players.create!(name: "Jerry", age: 5)
      hank = team_2.players.create!(name: "Hank", age: 15)
      peter = team_2.players.create!(name: "Peter", age: 15)
      lommy = team_2.players.create!(name: "Lommy", age: 15)

      expect(competition_1.average_competition_age).to eq(10)
    end
  end
end
