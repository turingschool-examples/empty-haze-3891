class CompetitionTeamsController < ApplicationController
  def create
    CompetitionTeam.create(competition_id: params[:competition_id], team_id: params[:team_id])
    redirect_to competition_path(params[:team_id])
  end
end
