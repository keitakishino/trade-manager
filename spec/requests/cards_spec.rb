require 'rails_helper'

RSpec.describe "Cards", type: :request do
  describe "GET /index" do
    before do
      http_mock = double("HTTP")
      allow(http_mock).to receive(:body).and_return({"data"=>["Ponder", "Pondering Mage"]}.to_json)
      allow(Net::HTTP).to receive(:get_response).and_return(http_mock)
    end
    it "200が返ること" do
      get cards_path
      expect(response).to have_http_status(200)
    end

    describe "検索パラメータが存在する場合" do
      it "検索結果が存在すること" do
        get cards_path, params: { name: "ponder" }
        expect(response.body).to include "Ponder"
      end
    end
  end
end
