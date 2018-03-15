class AddUsersToGames < ActiveRecord::Migration[5.1]
  def change
    add_reference :games, :users, foreign_key: true
  end
end
