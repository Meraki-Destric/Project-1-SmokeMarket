json.extract! game, :id, :logo, :name, :description, :rating, :user_id, :creator_id, :created_at, :updated_at
json.url game_url(game, format: :json)
