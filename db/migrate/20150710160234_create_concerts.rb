class CreateConcerts < ActiveRecord::Migration
  def change
    create_table :concerts do |t|
      t.string :artist
      t.string :venue
      t.string :description
      t.datetime :date
      t.string :city
      t.float :price
      t.string :poster

      t.timestamps null: false
    end
  end
end
