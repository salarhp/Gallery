class ImagesController < ApplicationController

  def index
    @images = Image.all
    @categories = Category.all
  end

  def new
    @image = Image.new
  end

  def create
    @image = Image.new(image_params)
    if @image.save
      flash[:notice] = "image created"
      redirect_to root_path
    else
      render 'new'
    end
  end

  def destroy
    @image = Image.find(params[:id])
    @image.destroy

    flash[:notice]="image deleted"

    redirect_to images_path
  end

  private
  def image_params
    params.require(:image).permit(:image,:image_title,:category_id ,:image_description,:remote_image_url,:image_file_size,:iamge_content_type)
  end
end