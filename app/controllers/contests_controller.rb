class ContestsController < ApplicationController
  before_action :logged_in_user, except: [:index, :show, :start, :vote]
  before_action :admin_user,     only: [:new, :edit, :update, :destroy]

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

    @random_photos = @contest.photos.limit(20).order("RANDOM()")
    random_counter = 0
    @photo1 = @random_photos[random_counter]
    @lo_range = @photo1.score - 400
    @hi_range = @lo_range + 800
    @photo2 = @contest.photos.where(score: @lo_range..@hi_range).limit(1).order("RANDOM()")[0]
    while @photo1 == @photo2
      random_counter += 1
      if random_counter == @random_photos.size
        flash[:danger] = "No available photo matching"
        redirect_to root_path
      end
      @photo1 = @random_photos[random_counter]
      @lo_range = @photo1.score - 400 if !@photo1.nil?
      @hi_range = @lo_range + 800
      @photo2 = @contest.photos.where(score: @lo_range..@hi_range).limit(1).order("RANDOM()")[0]
    end
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

  def ranking
    @contest = Contest.find(params[:id])
    @photos = @contest.photos.limit(10).order(score: :desc)
  end

  private

  def contest_params
    params.require(:contest).permit(:name, :criteria)
  end


end
