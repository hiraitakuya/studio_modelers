class ProductsController < ApplicationController
  def new
    @product = Product.new
    @photos = @product.photos.build
  end

  def create
    @product = Product.new(product_params)
    if @product.photos.present?
      if @product.save
        redirect_to root_path
      else
        redirect_to action: :new
      end
    else
      redirect_to action: :new
    end
  end

  def show
    @product = Product.find(params[:id])
  end
  
  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    length = @product.photos.length
    i = 0
    while i < length do
      if  product_update_params[:photos_attributes]["#{i}"]["_destroy"] == "0"
        @product.update(product_update_params)
        redirect_to users_show_path
        return
      else
        i += 1
      end
    end
    if product_update_params[:photos_attributes]["#{i}"]
      @product.update(product_update_params)
    end
    redirect_to edit_product_path(@product.id)
    return
  end

  def destroy
    product = Product.find(params[:id])
    product.destroy
    redirect_to root_path
  end

  private

  def product_params
    params.require(:product).permit(
      :title,
      :text,
      [photos_attributes: [:id, :_destroy, :image_url]]
    ).merge(
      user_id: current_user.id
    )
  end

  def product_update_params
    params.require(:product).permit(
      :title,
      :text,
      [photos_attributes: [:id, :_destroy, :image_url]]
    ).merge(
      user_id: current_user.id
    )
  end
end
