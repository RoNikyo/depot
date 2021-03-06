# ProductsController
class ProductsController < ApplicationController
  before_filter :find_product, except: [:index, :new, :create]

  # GET /products
  # GET /products.json
  def index
    @products = Product.order('title').page(params[:page]).per(4)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @products }
    end
  end

  # GET /products/1
  # GET /products/1.json
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @product }
    end
  end

  # GET /products/new
  # GET /products/new.json
  def new
    @product = Product.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @product }
    end
  end

  # GET /products/1/edit
  def edit; end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(params[:product])
    respond_to do |format|
      if @product.save
        format.html do
          redirect_to @product, notice: 'Product was successfully created.'
        end
        format.json do
          render json: @product, status: :created, location: @product
        end
      else
        format.html { render action: 'new' }
        format.json do
          render json: @product.errors, status: :unprocessable_entity
        end
      end
    end
  end

  # PUT /products/1
  # PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update_attributes(params[:product])
        format.html do
          redirect_to @product, notice: 'Product was successfully updated.'
        end
        format.json { head :ok }
      else
        format.html { render action: 'edit' }
        format.json do
          render json: @product.errors, status: :unprocessable_entity
        end
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy

    respond_to do |format|
      format.html { redirect_to products_url }
      format.json { head :ok }
    end
  end

  private

  def find_product
    @product = Product.find(params[:id])
  end
end
