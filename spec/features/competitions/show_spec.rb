require 'rails_helper'

RSpec.describe 'competition show page' do
  before :each do
    @comp1 = Competition.create!(name: "Big 5", location: "Savannah", sport: "Baseball")
    @comp2 = Competition.create!(name: "The Comp", location: "Dallas", sport: "Tennis")
    @comp3 = Competition.create!(name: "Grand Prix", location: "Reno", sport: "Racing")
    @team1 = Team.create!(nickname: "The Catchers", hometown: "Guyton")
    @team2 = Team.create!(nickname: "The Throwers", hometown: "Bluffington")
    @team3 = Team.create!(nickname: "The Lobbers", hometown: "New York")
    @comp_team1 = CompetitionTeam.create!(competition_id: @comp1.id, team_id: @team1.id)
    @comp_team1 = CompetitionTeam.create!(competition_id: @comp1.id, team_id: @team2.id)
    @comp_team1 = CompetitionTeam.create!(competition_id: @comp2.id, team_id: @team3.id)
    @player1 = @team1.players.create!(name: "Cory", age: 20)
    @player2 = @team1.players.create!(name: "Cris", age: 40)
    @player3 = @team2.players.create!(name: "Ben", age: 40)
    @player4 = @team2.players.create!(name: "Adam", age: 20)
    @player5 = @team3.players.create!(name: "Jane", age: 20)
  end

  it "shows the competition details" do
    visit "/competitions/#{@comp1.id}"
    # binding.pry
    expect(page).to have_content(@comp1.name)
    expect(page).to have_content(@comp1.location)
    expect(page).to have_content(@comp1.sport)
  end

end
