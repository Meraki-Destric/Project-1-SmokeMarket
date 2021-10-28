class RemoveDataFromGames < ActiveRecord::Migration[6.1]
  def change
    remove_column :games, :user_id, :integer
    remove_column :games, :creator_id, :integer
  end
end
