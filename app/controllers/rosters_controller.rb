class RostersController < ApplicationController
  def new
    @roster = Roster.new
  end

  def create
    @roster = Roster.new(roster_params)

    if @roster.save
      redirect_to @roster
    else
      render :new, status: :unprocessable_content
    end
  end


  private

  def roster_params
    params.require(:roster).permit(:name)
  end
end
