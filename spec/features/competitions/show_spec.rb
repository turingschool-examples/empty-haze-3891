require 'rails_helper'

describe 'competition show page', type: :feature do
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
    visit competition_path(@comp_1)
  end

  describe 'display' do
    it 'shows all competition info' do
      within '#comp-info' do
        expect(page).to have_content(@comp_1.name)
        expect(page).to have_content(@comp_1.location)
        expect(page).to have_content(@comp_1.sport)

        expect(page).to_not have_content(@comp_2.name)
      end
    end

    it 'shows all team info' do
      within '#team-info' do
        expect(page).to have_content("This")
        expect(page).to have_content("Town1")
        expect(page).to have_content("That")
        expect(page).to have_content("Town3")
      end
    end

    it 'shows the avg age of players' do
      expect(page).to have_content("Average Age of Players: 27")
    end
  end
end