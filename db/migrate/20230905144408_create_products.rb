class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.integer :num, default: 1, null: false
      t.integer :price, default: 1, null: false

      t.timestamps
    end
  end
end
