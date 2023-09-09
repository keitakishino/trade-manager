class AddTraderToProduct < ActiveRecord::Migration[7.0]
  def change
    add_reference :products, :trader, foreign_key: true
  end
end