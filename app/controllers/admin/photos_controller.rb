class Admin::PhotosController < ApplicationController
  def index
    @photos = Photo.all
  end

  def new
    @photo = Photo.new
  end

  def create
  	@photo = Photo.new(photo_params)
    params[:photo][:tag_list].each do |tag|
      @photo.tag_list.add(tag.downcase) if tag.present?
    end
    if params[:photo][:new_tags].present?
      new_tags = params[:photo][:new_tags].split(',')
      new_tags.each do |new_tag|
        @photo.tag_list.add(new_tag)
      end
    end
		if @photo.save
			redirect_to admin_photos_path, notice: "photoed"
		else
      flash[:alert] = "choose a photo"
			render :new
		end
  end

  def destroy
    Photo.destroy(params[:id]) if params[:id]
    redirect_to admin_photos_path, notice: "deleted"
  end

  def photo_params
    params.require(:photo).permit(:image, :title, :tag_list, :new_tags)
  end
end
