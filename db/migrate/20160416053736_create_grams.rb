class CreateGrams < ActiveRecord::Migration
  def change
    create_table :grams do |t|
      t.string  :title
      t.text    :description
      t.string  :location_code

      t.timestamps null: false
    end
  end
end
