class CreateGames < ActiveRecord::Migration[6.1]
  def change
    create_table :games do |t|
      t.text :logo
      t.string :name
      t.text :description
      t.integer :rating

      t.timestamps
    end
  end
end
