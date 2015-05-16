class ContestsController < ApplicationController

  def index
    @contests = Contest.all
  end

  def new
    @contest = Contest.new
  end

  def show
    @contest = Contest.find(params[:id])
    @user = current_user
  end

  def create
    @contest = Contest.new(contest_params)

    if @contest.save
      redirect_to contests_path
    else
      render :new

    end


    def show
        @contest = Contest.find(params[:id])
    end


    def new
        @contest = Contest.new
    end


  end

  def enter_contest
  	@contest = Contest.find(params[:id])
  	@photo = Photo.find(params[:photo_id])
  	@photo.contest = @contest
  	if @photo.save	
  		p "it worked!"
  		redirect_to contest_path(@contest)
  	end
  	
  end

  private

  def contest_params
    params.require(:contest).permit(:name, :criteria)
  end
end

