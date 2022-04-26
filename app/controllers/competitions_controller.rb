class CompetitionsController < ApplicationController

  def index
    @competitions = Competition.all
  end

  def show
    @competition = Competition.find(params[:id])
  end

  def edit
    @competition = Competition.find(params[:id])
  end

end
