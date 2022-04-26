require 'rails_helper'

RSpec.describe 'Competition Show Page' do
  describe 'Competition Show' do
    it 'displays competition name, location and sport' do
      competition_1 = Competition.create!(name: 'Flight Fest', location: 'San Diego', sport: 'Basketball')
      competition_2 = Competition.create!(name: 'Jump City', location: 'Brooklyn', sport: 'Basketball')

      visit "/competitions/#{competition_1.id}"
      expect(page).to have_content("Flight Fest")
      expect(page).to have_content("San Diego")
      expect(page).to have_content("Basketball")

      expect(page).to_not have_content("Jump City")
      expect(page).to_not have_content("Brooklyn")
    end

    it 'displays all teams in competition name and hometown' do
      competition_1 = Competition.create!(name: 'Flight Fest', location: 'San Diego', sport: 'Basketball')
      competition_2 = Competition.create!(name: 'Jump City', location: 'Brooklyn', sport: 'Basketball')
      team_1 = competition_1.teams.create!(nickname: 'Mild', hometown: 'Detroit')
      team_2 = competition_1.teams.create!(nickname: 'Hot', hometown: 'Atlanta')
      team_3 = competition_2.teams.create!(nickname: 'Spicy', hometown: 'Seattle')
      team_4 = competition_2.teams.create!(nickname: 'Fire', hometown: 'Humbolt')

      visit "/competitions/#{competition_1.id}"
      expect(page).to have_content("Mild")
      expect(page).to have_content("Detroit")
      expect(page).to have_content("Hot")
      expect(page).to have_content("Atlanta")

      expect(page).to_not have_content("Spicy")
      expect(page).to_not have_content("Seattle")
      expect(page).to_not have_content("Fire")
      expect(page).to_not have_content("Humbolt")
    end

    it 'displays average age of all players in competition' do
      competition_1 = Competition.create!(name: 'Flight Fest', location: 'San Diego', sport: 'Basketball')
      competition_2 = Competition.create!(name: 'Jump City', location: 'Brooklyn', sport: 'Basketball')
      team_1 = competition_1.teams.create!(nickname: 'Mild', hometown: 'Detroit')
      team_2 = competition_1.teams.create!(nickname: 'Hot', hometown: 'Atlanta')
      team_3 = competition_2.teams.create!(nickname: 'Spicy', hometown: 'Seattle')
      team_4 = competition_2.teams.create!(nickname: 'Fire', hometown: 'Humbolt')
      andrew = team_1.players.create!(name: "Andrew", age: 1)
      tom = team_1.players.create!(name: "Tom", age: 2)
      jerry = team_1.players.create!(name: "Jerry", age: 6)
      hank = team_2.players.create!(name: "Hank", age: 1)
      peter = team_2.players.create!(name: "Peter", age: 2)
      lommy = team_2.players.create!(name: "Lommy", age: 6)
      zach = team_3.players.create!(name: "Zach", age: 200)
      rookie = team_4.players.create!(name: "Rookie", age: 600)

      visit "/competitions/#{competition_1.id}"
      expect(page).to have_content("Player Average Age: 3")
    end
  end
end
