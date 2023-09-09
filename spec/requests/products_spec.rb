require 'rails_helper'

RSpec.describe "Products", type: :request do
  let(:product) { create(:product) }
  describe "GET /index" do
    it "一覧にデータが存在すること" do
      product
      get products_path
      expect(response).to have_http_status(200)
      expect(response.body).to include "Force of Will"
    end
  end

  describe "GET /edit" do
    it "200が返ること" do
      get edit_product_path(product)
      expect(response).to have_http_status(200)
    end
  end

  describe "GET /new" do
    it "カード名が表示されていること" do
      get new_product_path, params: { name: 'Brainstorm' }
      expect(response).to have_http_status(200)
      expect(response.body).to include "Brainstorm"
    end
  end

  describe "POST /create" do
    let(:trader) { create(:trader) }
    it "データが保存されること" do
      post products_path, params: { product: { name: 'Brainstorm', num: 1, price: 100, trader: trader.id } }, as: :turbo_stream
      expect(Product.find_by(name: 'Brainstorm')).to be_present
    end
  end

  describe "PATCH(PUT) /update" do
    it "データが更新されること" do
      patch product_path(product.id), params: { product: { num: 2, price: 15000} }, as: :turbo_stream
      force_of_will = Product.find_by(name: 'Force of Will')
      expect(force_of_will.num).to eq 2
      expect(force_of_will.price).to eq 15000
    end
  end

  describe "DELETE /destory" do
    it "データが削除されること" do
      delete product_path(product.id), as: :turbo_stream
      expect(Product.find_by(name: 'Force of Will')).to be_nil
    end
  end
end
