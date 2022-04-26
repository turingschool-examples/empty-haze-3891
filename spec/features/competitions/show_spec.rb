require 'rails_helper'

RSpec.describe 'Competition Show Page' do
  describe 'As user when I visit a competition show page' do
    it 'Then I see the competitions name, location, and sport' do
      comp1 = Competition.create!(name: 'name1', location: 'location1', sport: 'sport1')
      comp2 = Competition.create!(name: 'name2', location: 'location2', sport: 'sport2')

      visit "/competitions/#{comp1.id}"

      expect(page).to have_content("#{comp1.name}")
      expect(page).to have_content("#{comp1.location}")
      expect(page).to have_content("#{comp1.sport}")
      expect(page).to_not have_content("#{comp2.name}")
      expect(page).to_not have_content("#{comp2.location}")
      expect(page).to_not have_content("#{comp2.sport}")
    end

    it 'I see the name and hometown of all teams in this competition' do
      comp1 = Competition.create!(name: 'name1', location: 'location1', sport: 'sport1')
      comp2 = Competition.create!(name: 'name2', location: 'location2', sport: 'sport2')

      team1 = Team.create!(nickname: 'nickname1', hometown: 'hometown1')
      team2 = Team.create!(nickname: 'nickname2', hometown: 'hometown2')
      team3 = Team.create!(nickname: 'nickname3', hometown: 'hometown3')

      tc1 = TeamCompetition.create!(team: team1, competition: comp1)
      tc2 = TeamCompetition.create!(team: team2, competition: comp1)
      tc3 = TeamCompetition.create!(team: team3, competition: comp2)
      visit "/competitions/#{comp1.id}"

      expect(page).to have_content("#{team1.nickname}")
      expect(page).to have_content("#{team1.hometown}")
      expect(page).to have_content("#{team2.nickname}")
      expect(page).to have_content("#{team2.hometown}")
      expect(page).to_not have_content("#{team3.nickname}")
      expect(page).to_not have_content("#{team3.hometown}")
    end

    it 'I see the average age of all players in the competition' do

      team1 = Team.create!(nickname: 'nickname1', hometown: 'hometown1')
      team2 = Team.create!(nickname: 'nickname2', hometown: 'hometown2')
      team3 = Team.create!(nickname: 'nickname3', hometown: 'hometown3')

      comp1 = Competition.create!(name: 'name1', location: 'location1', sport: 'sport1')
      comp2 = Competition.create!(name: 'name2', location: 'location2', sport: 'sport2')

      player1 = team1.players.create!(name: 'jane', age: 20)
      player2 = team1.players.create!(name: 'joan', age: 30)
      player3 = team2.players.create!(name: 'jack', age: 40)
      player4 = team2.players.create!(name: 'jill', age: 10)
      player5 = team3.players.create!(name: 'joe', age: 50)


      tc1 = TeamCompetition.create!(team: team1, competition: comp1)
      tc2 = TeamCompetition.create!(team: team2, competition: comp1)
      tc3 = TeamCompetition.create!(team: team3, competition: comp2)

      visit "/competitions/#{comp1.id}"

      expect(page).to have_content("25")
      expect(page).to_not have_content("30")
    end

    it 'Then I see a link to register a new team' do
      team1 = Team.create!(nickname: 'nickname1', hometown: 'hometown1')
      team2 = Team.create!(nickname: 'nickname2', hometown: 'hometown2')
      team3 = Team.create!(nickname: 'nickname3', hometown: 'hometown3')

      comp1 = Competition.create!(name: 'name1', location: 'location1', sport: 'sport1')
      comp2 = Competition.create!(name: 'name2', location: 'location2', sport: 'sport2')

      player1 = team1.players.create!(name: 'jane', age: 20)
      player2 = team1.players.create!(name: 'joan', age: 30)
      player3 = team2.players.create!(name: 'jack', age: 40)
      player4 = team2.players.create!(name: 'jill', age: 10)
      player5 = team3.players.create!(name: 'joe', age: 50)


      tc1 = TeamCompetition.create!(team: team1, competition: comp1)
      tc2 = TeamCompetition.create!(team: team2, competition: comp1)
      tc3 = TeamCompetition.create!(team: team3, competition: comp2)

      visit "/competitions/#{comp1.id}"

      expect(page).to have_link("Register a new Team")
      click_link "Register a new Team"
      expect(current_path).to eq("/competitions/#{comp1.id}/teams/new")
    end

    it 'When I fill in this form with a teams hometown and nickname' do
      team1 = Team.create!(nickname: 'nickname1', hometown: 'hometown1')
      team2 = Team.create!(nickname: 'nickname2', hometown: 'hometown2')
      team3 = Team.create!(nickname: 'nickname3', hometown: 'hometown3')

      comp1 = Competition.create!(name: 'name1', location: 'location1', sport: 'sport1')
      comp2 = Competition.create!(name: 'name2', location: 'location2', sport: 'sport2')

      player1 = team1.players.create!(name: 'jane', age: 20)
      player2 = team1.players.create!(name: 'joan', age: 30)
      player3 = team2.players.create!(name: 'jack', age: 40)
      player4 = team2.players.create!(name: 'jill', age: 10)
      player5 = team3.players.create!(name: 'joe', age: 50)


      tc1 = TeamCompetition.create!(team: team1, competition: comp1)
      tc2 = TeamCompetition.create!(team: team2, competition: comp1)
      tc3 = TeamCompetition.create!(team: team3, competition: comp2)

      visit "/competitions/#{comp1.id}/teams/new"

      fill_in 'nickname', with: 'city'
      fill_in 'hometown', with: 'different'
      click_button "Submit"

      expect(teams.last.nickname).to eq('city')
      expect(teams.last.hometown).to eq('different')
      expect(current_path).to eq("/competitions/#{comp1.id}")
    end
  end
end