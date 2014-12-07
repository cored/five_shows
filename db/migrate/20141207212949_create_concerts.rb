class CreateConcerts < ActiveRecord::Migration
  def change
    create_table :concerts do |t|
      t.string :artist
      t.string :uri
      t.string :name

      t.timestamps
    end
  end
end
