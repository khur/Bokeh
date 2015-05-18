module API
  class PhotosController < ApplicationController
    protect_from_forgery with: :null_session
    def index
      render json: Photo.all
    end


    def show
      render json: Photo.find(params[:id])
    end

    def new
      @photo = Photo.new
      render 'photos/new'
    end

    def create
      @photo = Photo.new(photo_params)
      @photo.user = current_user

      if @photo.save
        # render json: @photo, status: 201, location: [:api, @photo]
        redirect_to current_user
      else
        render json: @photo.errors, status: 422
      end
    end

    def update
      photo = Photo.find(params[:id])

      if photo.update(photo_params)
        render json: photo
      else
        render json: photo.errors, status: 422
      end
    end

    def destroy
      photo = Photo.find(params[:id])

      photo.destroy
      head 204
    end

    def self.random
      render json: Photo.find(params[:id])
    end

    private
    def photo_params
      params.require(:photo).permit(:image, :score, :contest_id)
    end
  end
end
