FactoryBot.define do
  factory :product do
    name {'Force of Will'}
    num { 1 }
    price { 13000 }
    trader
  end
end