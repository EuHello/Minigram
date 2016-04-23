class AddImageUrlToGrams < ActiveRecord::Migration
  def change
    add_column :grams, :image_url, :string
  end
end
