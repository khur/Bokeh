module API
  class PhotosController < ApplicationController
    protect_from_forgery with: :null_session
    def index
      render json: Photo.all
    end


    def show
      render json: Photo.find(params[:id])
    end

    def create
      photo= Photo.new(photo_params)

      if photo.save
        render json: photo, status: 201, location: [:api, photo]
      end
    end


    private
    def photo_params
      params.require(:photo).permit(:url)
    end

  end
end
