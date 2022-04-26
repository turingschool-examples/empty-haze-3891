class Competition < ApplicationRecord
  has_many :competition_teams
  has_many :teams, through: :competition_teams

  def average_competition_age
    avg_per_team = teams.map do |team|
      team.average_age
    end.compact
    avg_per_team.sum / avg_per_team.size.to_f
  end
end
