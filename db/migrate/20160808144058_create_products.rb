class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :title
      t.string :description
      t.string :text
      t.string :image_url
      t.decimal :ptice, precision: 8, scale: 2

      t.timestamps
    end
  end
end
