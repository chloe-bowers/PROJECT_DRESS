class CreateOffers < ActiveRecord::Migration[7.0]
  def change
    create_table :offers do |t|
      t.float :price_per_day
      t.text :condition
      t.string :title
      t.integer :size
      t.text :description
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
