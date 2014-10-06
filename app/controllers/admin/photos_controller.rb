class Admin::PhotosController < ApplicationController
  def index
  	@photo = Photo.new
  	@photos = Photo.all
  end

  def create
  	@photo = Photo.new(photo_params)
		if @photo.save
			redirect_to admin_photos_path, notice: "photoed"
		else
			redirect_to admin_photos_path, notice: "error"
		end
  end

  def destroy
    Photo.destroy(params[:id]) if params[:id]
    redirect_to admin_photos_path, notice: "deleted"
  end

  def photo_params
    params.require(:photo).permit(:image, :title)
  end
end
