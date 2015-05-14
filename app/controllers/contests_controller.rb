class ContestsController < ApplicationController
  def index
    @contests = Contest.all
  end

  def new
    @contest = Contest.new
  end

  def show
    @contest = Contest.find(params[:id])
  end

  def create
    @contest = Contest.new

    if @contest.save
      redirect_to contest_path
    else
      render :new
    end
  end

  def edit
    @contest = Contest.find(params[:id])
  end

  def update
    @contest = Contest.find(params[:id])

    if @contest.update_attributes(contest_params)
      redirect_to contest_path(@contest)
    else
      render :edit
    end
  end

  def destroy
    @contest = Contest.find(params[:id])

    if @contest.destroy
      redirect_to contests_path
    end
    
  end


  private

  def contest_params
    params.require(:contest).permit(:name)
  end
end
