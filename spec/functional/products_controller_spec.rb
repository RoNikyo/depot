require 'rails_helper'

describe ProductsController, type: :controller do
  context "GET #index" do
    it "responds successfully with an HTTP 200 status code" do
      get :index
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
  end

  context "GET #new" do
    it "responds successfully with an HTTP 200 status code" do
      get :new
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
  end

  context "POST #create" do
    let(:product) do
      { title: 'title', image_url: 'url.png', description: 'desc', price: 12 }
    end
    it "should create product" do
      post :create, product: product
      expect(response).to redirect_to(product_url(id: 1))
    end
  end

  context "GET #show" do
    let(:product) do
      { title: 'title', image_url: 'url.png', description: 'desc', price: 12 }
    end
    it 'should show the product' do
      post :create, product: product
      get :show, id: 1
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
  end


  # it "should get edit" do
  #   get :edit, id: @product.to_param
  #   assert_response :success
  # end

  # it "should update product" do
  #   #put :update, id: @product.to_param, product: @product.attributes
  #   put :update, id: @product.to_param, product: @update
  #   assert_redirected_to product_path(assigns(:product))
  # end

  # it "should destroy product" do
  #   assert_difference('Product.count', -1) do
  #     delete :destroy, id: @product.to_param
  #   end

  #   assert_redirected_to products_path
  # end
end
