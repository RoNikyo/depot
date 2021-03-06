# encoding: UTF-8

# CartsController
class CartsController < ApplicationController
  before_filter :find_cart, only: [:show, :update, :edit]
  # GET /carts
  # GET /carts.json
  def index
    @carts = Cart.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @carts }
    end
  end

  # GET /carts/1
  # GET /carts/1.json
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @cart }
    end
  rescue => e
    redirect_to store_index_path, notice: e.message
  end

  # GET /carts/new
  # GET /carts/new.json
  def new
    @cart = Cart.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @cart }
    end
  end

  # GET /carts/1/edit
  def edit; end

  # POST /carts
  # POST /carts.json
  def create
    @cart = Cart.new(params[:cart])

    respond_to do |format|
      if @cart.save
        format.html do
          redirect_to @cart, notice: 'Cart was successfully created.'
        end
        format.json { render json: @cart, status: :created, location: @cart }
      else
        format.html { render action: 'new' }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /carts/1
  # PUT /carts/1.json
  def update
    respond_to do |format|
      if @cart.update_attributes(params[:cart])
        format.html do
          redirect_to @cart, notice: 'Cart was successfully updated.'
        end
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /carts/1
  # DELETE /carts/1.json
  def destroy
    @cart = current_cart
    @cart.destroy
    session[:cart_id] = nil

    respond_to do |format|
      format.html do
        redirect_to store_index_path
      end
      format.json { head :ok }
    end
  end

  private

  def find_cart
    @cart = Cart.find(params[:id])
  end
end
