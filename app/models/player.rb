class Player < ApplicationRecord
  belongs_to :team
  has_many :competition_teams, through: :team
  has_many :competitions, through: :competition_teams

  def average_age(competition)
    binding.pry
    #players.average(:age)
    #self.teams.average(players: :age)
    competition.players.average(:age)
  end

end
