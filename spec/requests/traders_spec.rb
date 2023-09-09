require 'rails_helper'

RSpec.describe "Traders", type: :request do
  let(:trader) { create(:trader) }
  describe "GET /index" do
    it "一覧にデータが存在すること" do
      trader
      get traders_path
      expect(response).to have_http_status(200)
      expect(response.body).to include "Test User"
    end
  end

  describe "GET /new" do
    it "200が返ること" do
      get new_trader_path
      expect(response).to have_http_status(200)
    end
  end

  describe "POST /create" do
    it "データが保存されること" do
      post traders_path, params: { trader: { name: 'Test User'} }
      expect(Trader.find_by(name: 'Test User')).to be_present
    end
  end

  describe "DELETE /destory" do
    let(:product) { create(:product, trader: trader) }
    it "データが削除されること" do
      delete trader_path(trader.id), as: :turbo_stream
      expect(Trader.find_by(name: 'Test User')).to be_nil
    end

    it "関連データが削除されること" do
      delete trader_path(trader.id), as: :turbo_stream
      expect(Product.find_by(name: 'Brainstorm')).to be_nil
    end
  end
end
