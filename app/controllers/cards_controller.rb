class CardsController < ApplicationController
  def index
    if search_query.any?
      res = autocomplete(search_query[:name])
      res = JSON.parse(res.body)
      @cards = res["data"]
    end
  end

  private

  def search_query
    permited = params.permit(:name)
    permited.to_h
  end

  def autocomplete(card_name)
    uri_head = Settings.https_header + Settings.scryfall.root_uri + Settings.scryfall.cards.autocomplete.uri
    if card_name
      uri_params = Settings.scryfall.cards.autocomplete.q + card_name.gsub(" ", "+")
    end
    uri = URI.parse(uri_head + uri_params)
    Net::HTTP.get_response(uri)
  end
end
