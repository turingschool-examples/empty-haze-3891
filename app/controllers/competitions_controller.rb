class CompetitionsController < ApplicationController
  def index
    @competitions = Competition.all
  end

  def show
    # require "pry"; binding.pry
    @competition = Competition.find(params[:id])
  end

  def new
    @competition = Competition.find(params[:id])

  end

  def create
    # require "pry"; binding.pry
    team = Team.new(team_params)
    team.save
    redirect_to
  end

  private

  def team_params
    params.permit(:nickname, :hometown)
  end
end