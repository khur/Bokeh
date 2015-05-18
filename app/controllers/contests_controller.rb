class ContestsController < ApplicationController
  before_action :logged_in_user, except: [:index, :show, :start, :vote] #don't have to login to do this
  before_action :admin_user,     only: [:destroy] #only admin can do this
  before_action :contest_owner, only: [:edit, :update]
  before_action :has_2_photos, only: [:start]

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
    @contest.user = current_user
    @contest.save
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

    @random_photos = @contest.photos.limit(20).order("vote_counter ASC")
    try_counter = 0
    @photo1 = @random_photos[try_counter]
    @photo2 = match_photo2(@photo1)

    # in case no candidates
    if @photo2.nil?
      try_counter += 1
      @photo1 = @random_photos[try_counter]
      @photo2 = match_photo2(@photo1)
      if (try_counter == @random_photos.size - 1) && @photo2.nil?
        flash[:danger] = "No available photo matches."
        redirect_to @contest
      end
    end
  end

  def match_photo2 photo1
    # search +/- 100
    @lo_range = photo1.score - 100
    @hi_range = photo1.score + 100
    @photo2_candidates = @contest.photos.where(score: @lo_range..@hi_range).limit(10).order("RANDOM()")
    return @photo2 = @photo2_candidates.where.not(id: @photo1.id).limit(1).order("RANDOM()")[0] unless @photo2.nil?

    # search +/- 200
    @lo_range = photo1.score - 200
    @hi_range = photo1.score + 200
    @photo2_candidates = @contest.photos.where(score: @lo_range..@hi_range).limit(10).order("RANDOM()")
    return @photo2 = @photo2_candidates.where.not(id: @photo1.id).limit(1).order("RANDOM()")[0] unless @photo2.nil?

    # search +/- 300
    @lo_range = photo1.score - 300
    @hi_range = photo1.score + 300
    @photo2_candidates = @contest.photos.where(score: @lo_range..@hi_range).limit(10).order("RANDOM()")
    return @photo2 = @photo2_candidates.where.not(id: @photo1.id).limit(1).order("RANDOM()")[0] unless @photo2.nil?

    # search +/- 400
    @lo_range = photo1.score - 400
    @hi_range = photo1.score + 400
    @photo2_candidates = @contest.photos.where(score: @lo_range..@hi_range).limit(10).order("RANDOM()")
    return @photo2 = @photo2_candidates.where.not(id: @photo1.id).limit(1).order("RANDOM()")[0]
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

  def contest_owner
    @contest = Contest.find(params[:id])

    if @contest.user != current_user
      flash[:danger] = "You are not the owner of this contest."
      redirect_to(root_url) unless @contest.user = current_user.admin
    end
  end

  def has_2_photos
    @contest = Contest.find(params[:id])
    unless @contest.photos.size >= 2
      flash[:danger] = "Not enough photos in current contest."
      redirect_to contest_path
    end
  end

  private

  def contest_params
    params.require(:contest).permit(:name, :criteria)
  end
end
