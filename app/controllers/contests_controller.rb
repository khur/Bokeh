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
  end

  def enter_contest
    @contest = Contest.find(params[:id])
    @photo = Photo.find(params[:photo_id])
    @photo.contest = @contest
    if @photo.save
      redirect_to contest_path(@contest)
    end
  end

  def start
    @contest = Contest.find(params[:id])
    # random_photos = @contest.photos.limit(2).order("RANDOM()")
    # @photo1 = random_photos[0]
    # @photo2 = random_photos[1]
    @photo1 = @contest.photos.limit(1).order("RANDOM()")
    @photo2 = @contest.photos.

  end

  def vote
    @contest = Contest.find(params[:id])
    @photo1 = Photo.find(params[:up_photo_id])
    @photo2 = Photo.find(params[:down_photo_id])
    photo1_current_score = @photo1.score
    photo2_current_score = @photo2.score
    @photo1.upvote(photo2_current_score)
    @photo2.downvote(photo1_current_score)

    redirect_to start_contest_path
  end

  private

  def contest_params
    params.require(:contest).permit(:name, :criteria)
  end
end
