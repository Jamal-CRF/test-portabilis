class ProductsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_product, only: [:show, :edit, :update, :destroy]

 
  def index
    @products = Product.all.order(created_at: :desc)
    
  end


  def show
  end


  def new
    @product = Product.new
    authorize @product
  end

 
  def edit
    authorize @product
  end

  # POST /products
  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to @product, notice: 'Product was successfully created.'
    else
      render :new
    end
  end


  def update
    if @product.update(product_params)
      redirect_to @product, notice: 'Product was successfully updated.'
    else
      render :edit
    end
  end

 
  def destroy
    @product.destroy
    redirect_to products_url, notice: 'Product was successfully destroyed.'
  end

  private
   
    def set_product
      @product = Product.find(params[:id])
    end

   
    def product_params
      params.require(:product).permit(:title, :description, :photo)
    end
end
